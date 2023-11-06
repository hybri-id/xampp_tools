::@Kriptonium
::Kriptonium/xampp-mysql-backup.bat
::Last active June 18, 2021 00:13

::@HybriiD - MOD
::A simple batch file to make mysql database backups. Plus it compress the .sql files with .gz to save disk space.
::mysql-backup.bat

::mysql_backup+mysql_restore+scheduler

@echo off

tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if "%ERRORLEVEL%"=="0" (
	goto continue
) else (
	goto mysql_not_running
)

:continue		
set dbUser=root
set dbPassword=dciadmin_973911
set backupDir="%~dp0backup\mysql"
set mysqldump="%~dp0mysql\bin\mysqldump.exe"
set mysqlDataDir="%~dp0mysql\data"
set zip="%~dp07z.exe"

 :: get date
 For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%b-%%a)
 :: get time
 For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
 set /a mytime+=10000
 set dirName="%mydate%_%mytime:~-4%"
 
 :: switch to the "data" folder
 pushd %mysqlDataDir%

 :: iterate over the folder structure in the "data" folder to get the databases
 for /d %%f in (*) do (

 	if not exist %backupDir%\%dirName%\ (
 		mkdir %backupDir%\%dirName%
 	)
 	echo -----------------------------
 	echo * MySQL backup are starting *
 	echo -----------------------------
 	echo Current backup : %%f.sql
 	%mysqldump% --host="localhost" --user=%dbUser% --password=%dbPassword% --single-transaction --add-drop-table --databases %%f > %backupDir%\%dirName%\%%f.sql

 	%zip% a -tgzip %backupDir%\%dirName%\%%f.sql.gz %backupDir%\%dirName%\%%f.sql
 	echo[
 	echo Done compress and archive thus file..now lets delete SQL file...
 	del %backupDir%\%dirName%\%%f.sql
 	echo OK, now I need to take a breather for 3 seconds...
 	choice /d y /t 3 > nul
 	cls
 )
 popd

 echo -----------------------------
 echo + MySQL backup are finished +
 echo -----------------------------
 pause
 start  "" "%backupDir%\"
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
 	start mysql_start
 )
)
exit