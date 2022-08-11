@ECHO off
setlocal
COLOR C
ECHO -------------------------------------------------------------------------
ECHO                   ** Update Skin **
ECHO -------------------------------------------------------------------------

REM STARTUP
set "skin_tempforzip_dir=%~dp0_package"
set "run_all=false"
set "compile=false"


REM CHECK | CREATE NECESSARY FILES
IF NOT EXIST "exclude_default_include_xbt.txt" (
(
	echo .gitattributes
	echo .gitignore
	echo _xbt\
	echo changelog.txt
	echo swan_info.md
	echo xml_folderfiles.ods
	echo LICENSE.txt
	echo README.md
)>"exclude_default_include_xbt.txt"
)
IF NOT EXIST "exclude_default.txt" (
	type exclude_default_include_xbt.txt > exclude_default.txt
	echo media\Textures.xbt >> "exclude_default.txt"
	echo media\Roundedge.xbt >> "exclude_default.txt"
)
IF EXIST "skinupdater.ini" (
	goto :get_config
	) ELSE (
	goto :set_config
)

REM SETUP
:set_config
set powershell_choose_folder=powershell -noprofile -command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null;$FolderBrowserDialog = New-Object System.Windows.Forms.FolderBrowserDialog; $FolderBrowserDialog.RootFolder = 'MyComputer'; $FolderBrowserDialog.ShowDialog()|out-null; $FolderBrowserDialog.SelectedPath}"
set powershell_choose_file=powershell -noprofile -command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null;$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog; $OpenFileDialog.ShowDialog()|out-null; $OpenFileDialog.FileName}"
ECHO.
ECHO Welcome, first set up required stuff
ECHO.

SET /p c=Did you arlready have Texturepacker.exe placed somewhere[y/n] ?  
IF /i "%c%" NEQ "y" goto :sub_texturepacker_dl

ECHO Choose the Location of your TexturePacker - Hit Enter
pause > nul
for /f "delims=" %%z in ('%powershell_choose_folder%') do set "texturepacker_executablelocation=%%z"
ECHO texturepacker_executablelocation=%texturepacker_executablelocation%>> "skinupdater.ini"

:hidden_back
SET /p skin_name=type the textlabel of addon name [eg skin.swan] ! :
ECHO skin_name=%skin_name%>> "skinupdater.ini"

SET /p skin_currentversionsuffix=type the value of current addon version [eg. 19.1.20] ! :
ECHO skin_currentversionsuffix=%skin_currentversionsuffix%>> "skinupdater.ini"

rem revisit bump float value autom
SET /p skin_versionsuffix=type the value of addon to bump to  [eg. 19.1.21] ! :
ECHO skin_versionsuffix=%skin_versionsuffix%>> "skinupdater.ini"

ECHO Choose the Location of your skin WORKIN DIRECTORY - Hit Enter
pause > nul
for /f "delims=" %%z in ('%powershell_choose_folder%') do set "skin_working_dir=%%z"
ECHO skin_working_dir=%skin_working_dir%>> "skinupdater.ini"

ECHO Choose the Location of GIT HUB BRANCH DIRECTORY - Hit Enter
pause > nul
for /f "delims=" %%z in ('%powershell_choose_folder%') do set "skin_git_dir=%%z"
ECHO skin_git_dir=%skin_git_dir%>> "skinupdater.ini"

REM IF NOT EXIST "%skin_git_dir%\.gitignore" (
REM (
	REM echo _updater\
	REM echo _package\
	REM echo skinupdater.ini
	REM echo exclude_default_include_xbt.txt
	REM echo exclude_default.txt
	REM echo updater_simple_v7.bat
REM )>.gitignore"
REM )

ECHO Choose the Location of KODI REPOSITORY ( the root directory where %skin_name%\ package should be updated ) - Hit Enter
pause > nul
for /f "delims=" %%z in ('%powershell_choose_folder%') do set "skin_kodirepo_dir=%%z"
ECHO skin_kodirepo_dir=%skin_kodirepo_dir%>> "skinupdater.ini"

ECHO.
ECHO Done. For a fresh start delete skinupdater.ini manually
ECHO.
goto :get_config



:get_config
for /f "tokens=1,2 delims==" %%a in (skinupdater.ini) do (
	if %%a==skin_name set "skin_name=%%b"
	if %%a==skin_currentversionsuffix set "skin_currentversionsuffix=%%b"
	if %%a==skin_versionsuffix set "skin_versionsuffix=%%b"
	if %%a==texturepacker_executablelocation set "texturepacker_executablelocation=%%b"
	if %%a==skin_working_dir set "skin_working_dir=%%b"
	if %%a==skin_git_dir set "skin_git_dir=%%b"
	if %%a==skin_kodirepo_dir set "skin_kodirepo_dir=%%b"
)

REM Check for new images ( detect for compile xbt )
cd %skin_working_dir%\media\
FOR /r %%a in (*.png *.jpg) DO IF EXIST "%%a" ( 
	set "compile=true"
	ECHO   	 "%%a"
)
ECHO.
if "%compile%" == "true" ECHO      - can be compiled
cd %~dp0
goto :OPTIONS 

:OPTIONS
ECHO.
ECHO  ***    OPTIONS   ***
ECHO.
ECHO    1. RUN ALL AT ONCE ( 2 - 5 )
ECHO.
ECHO    2.       Update git branch
ECHO.
ECHO    3.       Compile Texture
ECHO.
ECHO    4.       Update your Kodi Repo (creates zip packages ,updates *.xml and md5 checksum)
ECHO.
ECHO    5. CLOSE
ECHO.
ECHO    6.       Copy Addon Files from git to working directory ( this is excluded from 'run all' operation )
ECHO.
ECHO    7.       rebuild the addons.xml in the kodi repo
ECHO.

CHOICE /C 1234567 /M "Enter your ^choice and hit enter:"

IF ERRORLEVEL 7 GOTO sub_build_addonsxml
IF ERRORLEVEL 6 GOTO update_wd_from_git
IF ERRORLEVEL 5 GOTO END
IF ERRORLEVEL 4 GOTO update_repo
IF ERRORLEVEL 3 GOTO texture_compile
IF ERRORLEVEL 2 GOTO update_git
IF ERRORLEVEL 1 GOTO run_all

:run_all
set "run_all=true"
goto :update_git

:auto_routine
IF "%run_all%" == "true" (
	goto :%nextstep%
		) ELSE (
    ECHO.
	ECHO.
	ECHO ----------------------------------------------------------------------------------------
	ECHO ----------------------------------------------------------------------------------------
	ECHO                ** Finished - scroll up to check for errors. **
	ECHO              ** When done Hit a Key to Going back to to options **
	ECHO ----------------------------------------------------------------------------------------
	ECHO ----------------------------------------------------------------------------------------
	ECHO.
	pause > nul
	goto :OPTIONS
)

:update_git
set "nextstep=texture_compile"

rem copy new files to git - exclude xbt to git
ECHO.
xcopy "%skin_working_dir%" "%skin_git_dir%" /d /k /y /v /s /exclude:exclude_default.txt

rem conditional del img files from working dir after copy/backup
ECHO.
if "%compile%" == "true" (
	cd %skin_working_dir%\media\
	FOR /d /r %%b in ("*") DO IF EXIST "%%b" ( rd /s /q "%%b")
	FOR /r %%c in (*.png *.jpg) DO IF EXIST "%%c" ( del "%%c")
	cd %~dp0
)

if "%run_all%" == "false" if "%compile%" == "false" goto :options
if "%run_all%" == "true" if "%compile%" == "false" goto :update_repo
	)	else	(
	goto :texture_compile
)



:texture_compile
set "nextstep=update_repo"

ECHO.
rem compile xbt for zip package
if "%run_all%" == "true" if "%compile%" == "true" (
	if not exist "%skin_tempforzip_dir%\%skin_name%\media\" md "%skin_tempforzip_dir%\%skin_name%\media\"
	set "xbt_dir=%skin_tempforzip_dir%\%skin_name%\media"
)

rem compile new textures to working dir from git to to git _xbt folder
if "%run_all%" == "false" if "%compile%" == "true" (
	rem unresolved issues with spaces in outputdir pathname
		rem set "xbt_dir=%skin_working_dir%\test"set
	set "xbt_dir=%skin_git_dir%\_xbt"
	copy "%xbt_dir%\*.xbt" "%skin_working_dir%\%skin_name%\media\"
)

rem forced via option (3) - compile from git to to git _xbt folder
if "%run_all%" == "false" if "%compile%" == "false" (
	set "xbt_dir=%skin_git_dir%\_xbt"
)

START /B /WAIT %texturepacker_executablelocation%TexturePacker.exe -dupecheck -input %skin_git_dir%\media\ -output "%xbt_dir%\TexturesTEST.xbt"
cd %skin_git_dir%\themes\
	for /d %%t in (*) do (
	ECHO.
	ECHO Create ^*Theme^*.xbt from %%~t
	ECHO.
	START /B /WAIT %texturepacker_executablelocation%TexturePacker.exe -dupecheck -input %skin_git_dir%\themes\%%~t\ -output %xbt_dir%\%%~tTEST.xbt
	cd %~dp0
)
goto :auto_routine



:update_repo
set "nextstep=END"

rem copy files to skin_tempforzip/
IF "%compile%" == "true" (
	xcopy "%skin_working_dir%" "%skin_tempforzip_dir%\%skin_name%\" /k /y /v /s /exclude:exclude_default.txt
		) ELSE (
	xcopy "%skin_working_dir%" "%skin_tempforzip_dir%\%skin_name%\" /k /y /v /s /exclude:exclude_default_include_xbt.txt
)
ECHO.
powershell -Command "(gc '%skin_tempforzip_dir%\%skin_name%\addon.xml') -replace '%skin_currentversionsuffix%', '%skin_versionsuffix%' | Out-File -encoding default '%skin_tempforzip_dir%\%skin_name%\addon.xml'"
ECHO.

rem compress to zip ( via tar ) and generate md5 hash in repo dir
cd %skin_tempforzip_dir%\
tar -a -cf "%skin_kodirepo_dir%\%skin_name%\%skin_name%-%skin_versionsuffix%.zip" "%skin_name%"
cd %~dp0
certutil -hashfile "%skin_kodirepo_dir%\%skin_name%\%skin_name%-%skin_versionsuffix%.zip" md5 | find /i /v "md5" | find /i /v "certutil" > %skin_kodirepo_dir%\%skin_name%\%skin_name%-%skin_versionsuffix%.zip.md5
ECHO.

rem copy addon.xml to repo dir
copy "%skin_tempforzip_dir%\%skin_name%\addon.xml" "%skin_kodirepo_dir%\%skin_name%\"
ECHO.
rd /s /q %skin_tempforzip_dir%

:sub_build_addonsxml
REM new rebuild addons.xml in kodi repo dir
cd %skin_kodirepo_dir%
echo ^<^?xml version^=^"1.0^" encoding^=^"UTF-8^" standalone=^"yes^"^?^>> "addons.xml"
echo     ^<addons^>>> "addons.xml"
FOR /r %%b in ("addon.xml") DO IF EXIST "%%b" (
	type "%%~pbaddon.xml" | find /i /v "UTF-8" >> addons.xml
)
echo     ^</addons^>>> "addons.xml"
certutil -hashfile "addons.xml" md5 | find /i /v "md5" | find /i /v "certutil" > addons.xml.md5
cd %~dp0

goto :auto_routine

REM Download and extract Texturepacker to batch root
:sub_texturepacker_dl
set "texturetool_packagename=TexturePacker-win32-v141-20200105"

ECHO.
ECHO texturepacker will be dowloaded and extracted to %~dp0texturepacker
ECHO    -  NOTE: 7zip Application is needed for extract the downloaded archive
ECHO.
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://mirrors.kodi.tv/build-deps/win32/%texturetool_packagename%.7z', '%texturetool_packagename%.7z')"
ECHO    -  %texturetool_packagename%.7z downloaded

ECHO.
ECHO 7zip is required for extracting the package. Choose 7zip executable location and start extracting "TexturePacker.exe" to "%~dp0texturepacker".  -  Hit Enter
ECHO.
PAUSE > nul
for /f "delims=" %%z in ('%powershell_choose_file%') do set "zip_executablelocation=%%z"
ECHO.
if exist "%texturetool_packagename%.7z" (
	"%zip_executablelocation%" x "%texturetool_packagename%.7z"
	for /r %%a in (*.exe) do (
		md "%~dp0texturepacker" 2>nul
		move "%%a" "%~dp0texturepacker"
		rd /s /q "%texturetool_packagename%"
		del /f /q "%texturetool_packagename%.7z"
	)
)
REM set paths in config
ECHO zip_executablelocation=%zip_executablelocation%> "skinupdater.ini"
SET "texturepacker_executablelocation=%~dp0texturepacker"
ECHO texturepacker_executablelocation=%texturepacker_executablelocation%>> "skinupdater.ini"
ECHO.
ECHO Done. Going back to finish the SetUp.
ECHO.
goto :hidden_back


REM roll back from git to working dir
:update_wd_from_git
IF NOT EXIST "exclude_git_t_wd.txt" (
(
echo .gitattributes
echo .gitignore
echo _xbt\
echo addon.xml
echo changelog.txt
echo swan_info.md
echo xml_folderfiles.ods
echo LICENSE.txt
echo README.md
echo media\
echo themes\
echo _updater\
)>"exclude_git_t_wd.txt"
)
xcopy "%skin_git_dir%" "%skin_working_dir%\" /k /y /v /s /exclude:exclude_git_t_wd.txt
xcopy "%skin_git_dir%\_xbt" "%skin_working_dir%\media\" /d /k /y /v /s


:END

REM todo https://github.com/joshnh/Git-Commands
REM git add --all
REM git commit -m "next commit here" .
REM git push -u origin master
REM git pull