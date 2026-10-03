echo off
cls
rem WMIC has been removed in the latest Win11 releases, using Powershell now to get a nice timestamp
for /f "usebackq delims=" %%i in (`powershell -noprofile -c "(Get-Date -Format 'yyyyMMdd-HHmmss')"`) do set timestamp=%%i
echo -------------------------------------------------------------
echo Start of assembly
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