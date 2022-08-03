@ECHO off
setlocal
COLOR C
ECHO -------------------------------------------------------------------------
ECHO                   ** Update All **
ECHO -------------------------------------------------------------------------


for /d %%t in (*) do (
	ECHO.
	ECHO RUN %%~t Updater
	ECHO.
	echo %%~ft
	cd %%~ft
	call %%~ft\update.bat
	cd %~dp0
)
pause > nul

