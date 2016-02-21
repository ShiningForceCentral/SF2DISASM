echo off
cls


echo -------------------------------------------------------------
echo Start of assembly
echo Assembling sound driver ...
cd ../disasm/sound/
..\..\tools\asw\asw.exe ..\cube.asm
..\..\tools\asw\p2bin.exe ..\cube.p .\driver.bin -k -r $0000-$1fff
cd ../
echo Assembling game ...
SET "buildname=sf2build-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%%time:~6,2%.bin"
@"../tools/asm68k" /o ae- /p sf2.asm, "../build/%buildname%" > ../build/output.log
echo End of assembly, produced %buildname%

echo -------------------------------------------------------------
echo Checking build ...
cd ../build/
IF EXIST "%buildname%" (IF EXIST sf2.bin (fc /b "%buildname%" sf2.bin) ELSE echo sf2.bin does not exist in build directory) ELSE echo "%buildname%" does not exist, probably due to an assembly error. Check output.log.


pause