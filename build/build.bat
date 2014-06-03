echo off
cls
echo Start of assembly
cd ../disasm/sound/driver/
..\..\..\tools\asw\asw.exe ..\..\cube.asm
..\..\..\tools\asw\p2bin.exe ..\..\cube.p .\cube.bin -k -r $0000-$1fff
cd ../../
echo Executing assembler ...
@"../tools/asm68k" /o ae- /p sf2.asm, "../build/sf2build-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%%time:~6,2%.bin" > ../build/output.log
echo End of assembly, produced sf2build-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%%time:~6,2%.bin
pause