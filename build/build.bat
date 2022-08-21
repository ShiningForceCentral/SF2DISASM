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
SET "buildname=sf2build-%today%-%hour%%minutes%%seconds%"
@"../tools/asm68k" /e STANDARD_BUILD=0 /k /m /o ae-,e+,w+ /p sf2.asm, "../build/%buildname%.bin", ../build/%buildname%.sym, ../build/%buildname%.lst > ../build/output.log
echo End of assembly, produced %buildname%.bin

echo -------------------------------------------------------------
echo Checking build against reference ROM ...
cd ../build/
IF EXIST "%buildname%.bin" ..\tools\fixheader "%buildname%.bin"
IF EXIST "%buildname%.bin" (IF EXIST ../rom/sf2.bin (fc /b "%buildname%.bin" ../rom/sf2.bin) ELSE echo sf2.bin does not exist in build directory) ELSE echo "%buildname%.bin" does not exist, probably due to an assembly error. Check output.log.


pause