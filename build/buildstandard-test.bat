echo off
cls
rem WMIC has been removed in the latest Win11 releases, using Powershell now to get a nice timestamp
for /f "usebackq delims=" %%i in (`powershell -noprofile -c "(Get-Date -Format 'yyyyMMdd-HHmmss')"`) do set timestamp=%%i
echo -------------------------------------------------------------
echo Start of assembly
echo Checking sound binaries ...
cd ../disasm/code/common/tech/sound/cubewiz/
echo Assembling CUBEWIZ driver ...
    ..\..\..\..\..\..\tools\asw\asw.exe .\cubewiz.asm
    ..\..\..\..\..\..\tools\asw\p2bin.exe .\cubewiz.p ..\..\..\..\..\data\sound\cubewiz.bin -k -r $0000-$1fff
cd ../../../../../data/sound/musicbank0/
echo Assembling music bank 0 ...
    ..\..\..\..\tools\asw\asw.exe .\musicbank0.asm
    ..\..\..\..\tools\asw\p2bin.exe .\musicbank0.p ..\musicbank0.bin -k -r $8000-$ffff
cd ../musicbank1/
echo Assembling music bank 1 ...
    ..\..\..\..\tools\asw\asw.exe .\musicbank1.asm
    ..\..\..\..\tools\asw\p2bin.exe .\musicbank1.p ..\musicbank1.bin -k -r $8000-$ffff
cd ../sfxbank/
echo Assembling SFX bank ...
    ..\..\..\..\tools\asw\asw.exe .\sfxbank.asm
    ..\..\..\..\tools\asw\p2bin.exe .\sfxbank.p ..\sfxbank.bin -k -r $E000-$ffff
cd ../../../
echo Assembling game ...
SET "buildname=sf2standard-test-%timestamp%"
@"../tools/asm68k" /e VANILLA_BUILD=0 /e STANDARD_BUILD=1 /e TEST_BUILD=1 /k /m /o ae-,e+,w+ /p sf2.asm, "../build/%buildname%.bin", ../build/%buildname%.sym, ../build/%buildname%.lst > ../build/output.log
echo End of assembly, produced %buildname%.bin

echo -------------------------------------------------------------
echo Checking build ...
cd ../build/
SET expandedromsize=4194304
IF EXIST "%buildname%.bin" (
    FOR /F %%I IN ("%buildname%.bin") DO (
        IF "%%~zI" LEQ "%expandedromsize%" (
            echo Fixing ROM header ...
            @"../tools/fixheader" "../build/%buildname%.bin"
        )
        echo "%buildname%.bin" exists in build directory. Success!
    )
    copy "%buildname%.bin" standardbuild-last.bin
    copy "%buildname%.lst" standardbuild-last.lst
) ELSE (
    echo "%buildname%.bin" does not exist, probably due to an assembly error. Check output.log.
)


pause
