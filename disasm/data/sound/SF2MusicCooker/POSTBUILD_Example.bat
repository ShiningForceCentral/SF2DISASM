@echo off

rem Convenience script file to build ROM and start emulator.
rem This is called whenever SF2 Music Cooker successfully executes and write files to SF2DISASM folder.

rem -------------------------------------------------------------------------
rem This file is an example, you should modify the paths to suit your system!
rem -------------------------------------------------------------------------

SET BuildPath=C:\Dev\Github\SF2DISASM\build
SET EmuPath=C:\Dev\Github\__Emu

rem This example assumes you are using EmuHawk emulator, but you can adapt it for other emulators!

cd %BuildPath%
del standardbuild-last.bin
call buildstandard-test.bat < nul rem Skip the 'pause' command

IF EXIST "standardbuild-last.bin" (
	echo -------------------------------------
	echo Build successful, running emulator...
	echo -------------------------------------
	cd %EmuPath%
	EmuHawk.exe "%BuildPath%\standardbuild-last.bin"
) ELSE (
    echo Build has failed, cannot run emulator.
	pause
)