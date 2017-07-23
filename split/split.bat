echo off
cls
echo Start of split operation for file split/sf2.bin
echo Executing tools/splitrom.exe ...
cd ../disasm/
@"../tools/splitrom" ../rom/sf2.bin ../split/sf2splits.txt
echo End of split operation. Data extracted in disasm/ folder.
pause