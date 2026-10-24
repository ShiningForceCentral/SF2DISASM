rem Utility to clean the 'build' folder, the IF EXIST is there as a safety check in case the .bat is moved and run elsewhere
IF EXIST "buildstandard.bat" del *.log
IF EXIST "buildstandard.bat" del *.lst
IF EXIST "buildstandard.bat" del *.bin
IF EXIST "buildstandard.bat" del *.sym