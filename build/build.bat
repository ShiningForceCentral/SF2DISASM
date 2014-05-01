echo off
cls
echo Start of assembly
cd ../disasm/
echo Executing assembler ...
@"../tools/asm68k" /o ae- /p sf2.asm, "../build/sf2build-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%%time:~6,2%.bin" > ../build/output.log
echo End of assembly, produced sf2build-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%%time:~6,2%.bin
pause