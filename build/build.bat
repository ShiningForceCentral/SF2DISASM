echo off
cls
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set today=%Year%%Month%%Day%
set hour=%Hour%
set hour=0%hour%
set hour=%hour:~-2%
set minutes=%Minute%
set seconds=%Second%
echo -------------------------------------------------------------
echo Start of assembly
echo Assembling sound driver ...
cd ../disasm/data/sound/
..\..\..\tools\asw\asw.exe ..\..\code\common\tech\sound\sounddriver.asm
..\..\..\tools\asw\p2bin.exe ..\..\code\common\tech\sound\sounddriver.p .\sounddriver.bin -k -r $0000-$1fff
cd ../../
echo Assembling game ...
SET "buildname=sf2build-%today%-%hour%%minutes%%seconds%.bin"
@"../tools/asm68k" /o ae- /p sf2.asm, "../build/%buildname%" > ../build/output.log
echo End of assembly, produced %buildname%

echo -------------------------------------------------------------
echo Checking build ...
cd ../build/
IF EXIST "%buildname%" (IF EXIST sf2.bin (fc /b "%buildname%" sf2.bin) ELSE echo sf2.bin does not exist in build directory) ELSE echo "%buildname%" does not exist, probably due to an assembly error. Check output.log.


pause