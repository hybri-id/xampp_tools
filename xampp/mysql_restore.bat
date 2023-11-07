::@HybriiD_MOD
::mysql_backup+mysql_restore+scheduler
::A simple batch file to restore sql database backups. Plus it fits .gz compressed backups to save disk space.
::mysql-restore.bat

@echo off

tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if "%ERRORLEVEL%"=="0" (
	goto continue
) else (
	goto mysql_not_running
)

:continue		
set dbUser=root
set dbPassword=
set backupDir=%~dp0backup\mysql
set mysql=%~dp0mysql\bin\mysql.exe
set zip="%~dp07z.exe"

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
			echo:
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
pause
exit

:mysql_not_running
echo -----------------------------
echo !!WARNING COULDN'T CONTINUE!!
echo -----------------------------
echo Message: mysqld.exe is not running, please start it (e.g. via xampp-control)
pause
exit
