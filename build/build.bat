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
echo Assembling sound driver ...
cd ../disasm/data/sound/
..\..\..\tools\asw\asw.exe ..\..\code\common\tech\sound\sounddriver.asm
..\..\..\tools\asw\p2bin.exe ..\..\code\common\tech\sound\sounddriver.p .\sounddriver.bin -k -r $0000-$1fff
cd musicbank0/
..\..\..\..\tools\asw\asw.exe -x -E errors.log .\musicbank0.asm
..\..\..\..\tools\asw\p2bin.exe .\musicbank0.p ..\musicbank0build.bin -k -r $8000-$ffff
cd ../musicbank1/
..\..\..\..\tools\asw\asw.exe -x -E errors.log .\musicbank1.asm
..\..\..\..\tools\asw\p2bin.exe .\musicbank1.p ..\musicbank1build.bin -k -r $8000-$ffff
cd ../../../
echo Assembling game ...
SET "buildname=sf2build-%today%-%hour%%minutes%%seconds%.bin"
@"../tools/asm68k" /e EXPANDED_ROM=0 /e EXTENDED_SSF_MAPPER=0 /o ae-,e+,w+ /p sf2.asm, "../build/%buildname%" > ../build/output.log
echo End of assembly, produced %buildname%

echo -------------------------------------------------------------
echo Checking build against reference ROM ...
cd ../build/
IF EXIST "%buildname%" ..\tools\fixheader "%buildname%"
IF EXIST "%buildname%" (IF EXIST ../rom/sf2.bin (fc /b "%buildname%" ../rom/sf2.bin) ELSE echo sf2.bin does not exist in build directory) ELSE echo "%buildname%" does not exist, probably due to an assembly error. Check output.log.


pause