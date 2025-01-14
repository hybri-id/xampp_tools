::@Hybri-iD
::hybri-id/xampp_tools
::mysql_backup+mysql_restore+scheduler
::A simple batch file to restore sql database backups. 
::It works with .gz compressed SQL backups to save disk space.
::mysql-restore.bat

@echo off

:: checks for xampp & mysql installation/service execution
FOR /F "tokens=* USEBACKQ" %%F IN (`dir "C:\xampp\xampp-control.exe" /S/B`) DO (
	SET xamppfolder=%%F
)
set xamppfolder=%xamppfolder:~0,-17%

if exist %xamppfolder% (
	if not "%~dp0"=="%xamppfolder%" pushd %xamppfolder%
) else goto xampp_not_installed

FOR /F "tokens=* USEBACKQ" %%F IN (`dir "%xamppfolder%mysqldump.exe" /S/B`) DO (
	SET mysqldump=%%F
)
if not exist %mysqldump% goto mysql_not_installed else echo ALLRIGHT!

tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if "%ERRORLEVEL%"=="0" (
	goto continue
) else goto mysql_not_running

:: set the paths and SQL user/passwords
:continue		
	set dbUser=root
	set dbPassword=
	set zip=%xamppfolder%7z.exe
	set backupDir=%xamppfolder%backup\mysql
	set mysql=%xamppfolder%mysql\bin\mysql.exe

	:: search for the last backup
	FOR /F "delims=" %%i IN ('dir "%backupDir%" /b /ad-h /t:c /od') DO SET dirName=%%i

	:: switch to the "backup" folder
	pushd "%backupDir%\%dirName%"

	:: find all databases backups
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
				ping 127.0.0.1 -n 3 > nul
				cls	
			) else pause
		)
	)
	popd
	echo -----------------------------
	echo + MySQL restores are finished +
	echo -----------------------------
	echo You can now close this window.
	echo:
	pause
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
		start /min /b "" %xamppfolder%mysql_start
		goto :continue
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