::@Hybri-iD
::hybri-id/xampp_tools
::mysql_backup+mysql_restore+scheduler
::A simple batch file to restore sql database backups. 
::It works with .gz compressed SQL backups to save disk space.
::mysql-restore.bat

@echo off

:: checks for xampp & mysql installation/services
FOR /F "tokens=* USEBACKQ" %%F IN (`dir "C:\xampp\xampp-control.exe" /S/B`) DO (
	SET xamppfolder=%%F
)
set xamppfolder=%xamppfolder:~0,-17%

if exist %xamppfolder% (
	if not "%~dp0"=="%xamppfolder%" pushd %xamppfolder%
) else goto xampp_not_installed

FOR /F "tokens=* USEBACKQ" %%F IN (`dir "%xamppfolder%mysqldump.exe" /S/B`) DO SET mysqldump=%%F
if not exist %mysqldump% goto mysql_not_installed else echo ALLRIGHT!

tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if not "%ERRORLEVEL%"=="0" goto mysql_not_running else echo ALLRIGHT!

:: set the paths and SQL user/passwords
:continue
	set dbUser=root
	set dbPassword=
	set zip=%xamppfolder%7z.exe
	set mysql=%xamppfolder%mysql\bin\mysql.exe
	set backupDir=%xamppfolder%backup\mysql

	:: get date
	For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
	:: get time
	For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a.%%b)

	:: Start restoring the backups
	if not exist "%xamppfolder%\logs\" (
			mkdir "%xamppfolder%\logs"
	)
	if not exist "%backupDir%\" (
		echo The backups folder is empty!
		timeout 3 > NUL & exit
	)
	SET outputlog="%xamppfolder%\logs\Xamp_Tools_Output_%mydate%_%mytime%.log"
	SET errorlog="%xamppfolder%\logs\Xamp_Tools_Errors_%mydate%_%mytime%.log"
	cls
	echo -----------------------------
	echo * MySQL restore in progress *
	echo -----------------------------
	echo Date: %mydate% Time: %mytime%H - Log File: Xamp_Tools_Output_%mydate%_%mytime%.log
	echo == LOG RESTORE OUTPUT FILE %mydate%_%mytime% == >%outputlog%
	echo == LOG RESTORE ERRORS FILE %mydate%_%mytime% == >%errorlog%
	echo:
	echo You can see the results of this restore checking the LOGS.
	echo DO NOT CLOSE this window while backup restoring is in progress to avoid loss of data.
	echo:
	echo This window will close automatically when the backups are restored.
	echo:
	call :logit 1>>%outputlog% 2>>%errorlog% & exit /b 0
	::call "%~f0" 1>>"Xamp_Tools_Output_%mydate%_%mytime%.log" 2>"Xamp_Tools_Errors_%mydate%_%mytime%.log"

	:logit
	:: search for the last backup
	FOR /F "delims=" %%i IN ('dir "%backupDir%" /b /ad-h /t:c /od') DO SET dirName=%%i

	:: switch to the "backup" folder
	pushd "%backupDir%\%dirName%"

	:: find all database last backups & restore them
	for /f tokens^=* %%i in ('where .:*') do (
		echo Last backup found:
		echo Path: %%~dpi ^| Name: %%~nxi
		echo -----------------------------
		echo * MySQL restores are starting *
		echo -----------------------------
		echo Current backup : %%~nxi
		echo Database : %%~ni
		echo:
		echo Uncompressing databases...		 
		%zip% x "%%~nxi" -o"%%~dpi\" 
		for /f tokens^=* %%f in ('where *.sql') do (
			echo:
			echo Restoring database: %%~nf
			%mysql% --user=%dbUser% --password=%dbPassword% -e "CREATE DATABASE IF NOT EXISTS %%~nf"
			%mysql% --host="localhost" --user=%dbUser% --password=%dbPassword% --force %%~nf < "%%~dpi%%~nf.sql"
			if "%ERRORLEVEL%"=="0" (
				echo :
				echo Restoring %%~nf complete!...
				del "%%~dpi%%~nf.sql"
				echo OK, now I need to take a breather for 3 seconds...
				ping 127.0.0.1 -n 1 > nul
				cls	
			) else pause
		)
	)
	popd
	echo -----------------------------
	echo + MySQL restores are finished +
	echo -----------------------------
	echo:
	START "" notepad.exe %errorlog% & exit /b 0
exit

:mysql_not_running
	echo -----------------------------
	echo !!WARNING COULDN'T CONTINUE!!
	echo -----------------------------
	echo "Message: mysqld.exe is not running, please start it (e.g. via xampp-control)"
	echo Do you want we try to start the service for the backup task? (Y/N)
	CHOICE /C:YN
	IF ERRORLEVEL 1 SET M=1
	IF ERRORLEVEL 2 SET M=2
	if %M%==1 (
		start /min /b "" %xamppfolder%mysql_start & timeout 3 > NUL
		call :continue & exit /b 0
	) else exit

:mysql_not_installed
	echo -----------------------------
	echo !!WARNING COULDN'T CONTINUE!!
	echo -----------------------------
	echo "Message: MySQL is not installed, please install it first (e.g. via xampp package at https://www.apachefriends.org/es/index.html)"
	cmd /c exit -1073741510

:xampp_not_installed
	echo -----------------------------
	echo !!WARNING COULDN'T CONTINUE!!
	echo -----------------------------
	echo "Message: XAMPP is not installed, please install it first (e.g. via xampp package at https://www.apachefriends.org/es/index.html)"
	cmd /c exit -1073741510