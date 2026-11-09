@ECHO off

rem Put here the path to your SF2DISASM folder, it must have 'expanded musics' feature merged
SET SF2DISASMPath=C:\Dev\Github\SF2DISASM

rem -----------------------------------------------
rem --- Uncomment the usage method your prefer ----
rem -----------------------------------------------

rem Standard use, with manual confirmation required
SF2MusicCooker.exe "%SF2DISASMPath%"

rem Automated use, to do everything with 1 click
rem SF2MusicCooker.exe "%SF2DISASMPath%" --autoyes --nopause

rem Troubleshooting use
rem SF2MusicCooker.exe "%SF2DISASMPath%" --dumpnotes

rem -----------------------------------------
rem --- Advanced users: POSTBUILD script ----
rem -----------------------------------------

rem You can create a "POSTBUILD.bat" file in the tool folder that will run whenever the tool successfully executes.
rem This script is only invoked if the tool wrote the output files to the SF2DISASM folder, first argument is the path to the SF2DISASM folder.
rem A typical use of POSTBUILD script is to invoke "buildstandard-test.bat" and start an emulator.
rem You can use "POSTBUILD_Example.bat" as a template to write your own "POSTBUILD.bat" script.