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
SET "buildname=sfxbankbuild-%today%-%hour%%minutes%%seconds%"
echo -------------------------------------------------------------
cd sfxbank/
echo Start of assembly
    ..\..\..\..\tools\asw\asw.exe -x -E errors.log .\sfxbank.asm
    ..\..\..\..\tools\asw\p2bin.exe .\sfxbank.p ..\%buildname%.bin -k -r $E000-$ffff
echo End of assembly, produced %buildname%.bin

pause
