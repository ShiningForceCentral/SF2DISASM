echo off
cls
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set month=0%Month%
set month=%month:~-2%
set day=0%Day%
set day=%day:~-2%
set today=%Year%%month%%day%
set hour=%Hour%
set hour=0%hour%
set hour=%hour:~-2%
set minutes=0%Minute%
set minutes=%minutes:~-2%
set seconds=0%Second%
set seconds=%seconds:~-2%
echo -------------------------------------------------------------
echo Start of assembly
echo Checking sound binaries ...
cd ../disasm/data/sound/
IF NOT EXIST "sounddriver.bin" (
    echo Assembling sound driver ...
    ..\..\..\tools\asw\asw.exe ..\..\code\common\tech\sound\sounddriver.asm
    ..\..\..\tools\asw\p2bin.exe ..\..\code\common\tech\sound\sounddriver.p .\sounddriver.bin -k -r $0000-$1fff
) ELSE echo sounddriver.bin already exists!
IF NOT EXIST "cubewiz.bin" (
    echo Assembling Cube/Wiz driver ...
    ..\..\..\tools\asw\asw.exe ..\..\code\common\tech\sound\cubewiz.asm
    ..\..\..\tools\asw\p2bin.exe ..\..\code\common\tech\sound\cubewiz.p .\cubewiz.bin -k -r $0000-$1fff
) ELSE echo cubewiz.bin already exists!
cd musicbank0/
IF NOT EXIST "..\musicbank0.bin" (
    echo Assembling music bank 0 ...
    ..\..\..\..\tools\asw\asw.exe -x -E errors.log .\musicbank0.asm
    ..\..\..\..\tools\asw\p2bin.exe .\musicbank0.p ..\musicbank0.bin -k -r $8000-$ffff
) ELSE echo musicbank0.bin already exists!
cd ../musicbank1/
IF NOT EXIST "..\musicbank1.bin" (
    echo Assembling music bank 1 ...
    ..\..\..\..\tools\asw\asw.exe -x -E errors.log .\musicbank1.asm
    ..\..\..\..\tools\asw\p2bin.exe .\musicbank1.p ..\musicbank1.bin -k -r $8000-$ffff
) ELSE echo musicbank1.bin already exists!
cd ../../../
echo Assembling game ...
SET "buildname=sf2build-%today%-%hour%%minutes%%seconds%.bin"
@"../tools/asm68k" /e EXPANDED_ROM=1 /e EXTENDED_SSF_MAPPER=1 /o ae-,e+,w+ /p sf2.asm, "../build/%buildname%" > ../build/output.log
echo End of assembly, produced %buildname%

echo -------------------------------------------------------------
echo Checking build ...
cd ../build/
IF EXIST "%buildname%" (echo "%buildname%" exists in build directory. Success!) ELSE echo "%buildname%" does not exist, probably due to an assembly error. Check output.log.


pause