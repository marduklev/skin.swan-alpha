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
	cd C:\Users\mardu\Documents\GitHub\skin.swan-alpha\_updater\%%~t
	call C:\Users\mardu\Documents\GitHub\skin.swan-alpha\_updater\%%~t\update.bat
	cd %~dp0
)