echo off
REM For linux compatibility
    SETLOCAL EnableDelayedExpansion
cls
REM WMIC has been removed in the latest Win11 releases, using Powershell now to get a nice timestamp
for /f "usebackq delims=" %%i in (`powershell -noprofile -c "(Get-Date -Format 'yyyyMMdd-HHmmss')"`) do set timestamp=%%i
echo -------------------------------------------------------------
echo Start of assembly
REM Build music banks
echo Checking sound binaries ...
cd ../disasm/code/common/tech/sound/
echo Assembling sound driver ...
    ..\..\..\..\..\tools\asw\asw.exe .\sounddriver.asm
    ..\..\..\..\..\tools\asw\p2bin.exe .\sounddriver.p ..\..\..\..\data\sound\sounddriver.bin -k -r $0000-$1fff
cd ../../../../data/sound/musicbank0/
echo Assembling music bank 0 ...
    ..\..\..\..\tools\asw\asw.exe .\musicbank0.asm
    ..\..\..\..\tools\asw\p2bin.exe .\musicbank0.p ..\musicbank0.bin -k -r $8000-$ffff
cd ../musicbank1/
echo Assembling music bank 1 ...
    ..\..\..\..\tools\asw\asw.exe .\musicbank1.asm
    ..\..\..\..\tools\asw\p2bin.exe .\musicbank1.p ..\musicbank1.bin -k -r $8000-$ffff
REM Build text banks
echo Checking text banks ...
cd ../../scripting/text/
for /f "tokens=*" %%i in ('java -version 2^>^&1') do (
    set "JAVA_VERSION=%%i"
    goto :endJavaCheck
)
:endJavaCheck
set "NO_JAVA=Can't recognize"
if /i "!JAVA_VERSION:~0,15!"=="!NO_JAVA!" (
    echo Warning: Java not installed so text banks will not be rebuilt. See https://github.com/ShiningForceCentral/SF2DISASM#editor-tool-requirements-
) ELSE (
    echo Assembling text banks ...
    java -XX:+IgnoreUnrecognizedVMOptions -jar SF2TextEditor.jar --headless -i ./gamescript.txt -e ./
)
REM Assemble rom
cd ../../../
echo Assembling game ...
SET "buildname=sf2build-%timestamp%"
@"../tools/asm68k" /e VANILLA_BUILD=1 /k /m /o ae-,e+,w+ /p sf2.asm, "../build/%buildname%.bin", ../build/%buildname%.sym, ../build/%buildname%.lst > ../build/output.log
echo End of assembly, produced %buildname%.bin

echo -------------------------------------------------------------
echo Checking build against reference ROM ...
cd ../build/
IF EXIST "%buildname%.bin" ..\tools\fixheader "%buildname%.bin"
IF EXIST "%buildname%.bin" (IF EXIST ../rom/sf2.bin (fc /b "%buildname%.bin" ../rom/sf2.bin) ELSE echo sf2.bin does not exist in build directory) ELSE echo "%buildname%.bin" does not exist, probably due to an assembly error. Check output.log.


pause
