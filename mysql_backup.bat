::@Kriptonium
::Kriptonium/xampp-mysql-backup.bat
::Last active June 18, 2021 00:13

::@Hybri-iD
::hybri-id/xampp_tools
::mysql_backup+mysql_restore+scheduler
::A simple batch file to make mysql database backups. 
::It compress the .sql files with .gz to save disk space.
::mysql-backup.bat

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
	set mysqlDataDir=%xamppfolder%mysql\data
	set backupDir=%xamppfolder%backup\mysql

	:: get date
	For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%b-%%a)
	:: get time
	For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
	set /a mytime+=10000
	set dirName=%mydate%_%mytime:~-4%

	:: switch to the "data" folder
	pushd %mysqlDataDir%

	:: iterate over the folder structure in the "data" folder to get the databases
	for /d %%f in (*) do (
		cls
		if not exist "%backupDir%\%dirName%\" (
			mkdir "%backupDir%\%dirName%"
		)
		echo -----------------------------
		echo * MySQL backup are starting *
		echo -----------------------------
		echo Current backup : %%f.sql
		%mysqldump% --host="localhost" --user=%dbUser% --password=%dbPassword% --single-transaction --add-drop-table --databases %%f > "%backupDir%\%dirName%\%%f.sql"
		%zip% a -tgzip "%backupDir%\%dirName%\%%f.sql.gz" "%backupDir%\%dirName%\%%f.sql"
		if "%ERRORLEVEL%"=="0" (
			echo Done compress and archive thus files... 
			echo Now lets delete uncompressed SQL file...
			del %backupDir%\%dirName%\%%f.sql
			echo OK, now I need to take a breather for 3 seconds...
			ping 127.0.0.1 -n 1 > nul
		) else pause
	)
	popd
	echo -----------------------------
	echo + MySQL backup are finished +
	echo -----------------------------
	start  "" "%backupDir%\%dirName%\" & exit

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