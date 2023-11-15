::@HybriiD_MOD
::mysql_backup+mysql_restore+scheduler
::A simple batch file to schedule sql database backups. Plus it can make and restore backups in .gz format to save space.

::2023
::scheduler.bat

@echo off

if not "%1"=="am_admin" (
	powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
	exit /b
)

cd /D %~dp0
set SC=DAILY
set hour=00
set mint=00
goto continue

:select_schedule
echo Do you want to schedule backup...
echo:
echo 1: HOURLY - 2: DAILY - 3: WEEKLY - 4: MONTHLY - 5: ON SYSTEM START && echo: && echo CURRENT: %SC% && echo:
CHOICE /C:12345
IF ERRORLEVEL 1 SET SC=HOURLY
IF ERRORLEVEL 2 SET SC=DAILY
IF ERRORLEVEL 3 SET SC=WEEKLY
IF ERRORLEVEL 4 SET SC=MONTHLY
IF ERRORLEVEL 5 (
	SET SC=ONSTART
	goto create
)

:setdatetime
SET /p hour=Enter the time you want to make the %SC% backup (HH): 
SET /p mint=Enter the minutes (MM): 
set /a hour+=100
set /a mint+=100

:create
if "%SC%"=="ONSTART" (
	schtasks /create /tn "MySQL\%SC%_backup" /tr "%~dp0mysql_backup.bat" /sc %SC% /f
	goto continue
)
schtasks /create /tn "MySQL\%SC%_backup" /tr "%~dp0mysql_backup.bat" /sc %SC% /st %hour:~-2%:%mint:~-2% /f
if "%ERRORLEVEL%"=="0" (
	goto continue
) else (
	cls && goto setdatetime
)

:check_mysql
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if "%ERRORLEVEL%"=="0" (
	goto re
) else (
	echo -----------------------------
	echo !!WARNING COULDN'T CONTINUE!!
	echo -----------------------------
	echo "Message: mysqld.exe is not running, please start it (e.g. via xampp-control)"
	echo Do you want we try to start the service for the backup task? (Y/N)
CHOICE /C:YN
IF ERRORLEVEL 1 SET M=1
IF ERRORLEVEL 2 SET M=2
if %M%==1 (
	start "" mysql_start
)
)

:re
cls
echo ":::    :::     :::     ::::    ::::  :::::::::  :::::::::        ::::::::   ::::::::   :::                          
echo ":+:    :+:   :+: :+:   +:+:+: :+:+:+ :+:    :+: :+:    :+:      :+:    :+: :+:    :+:  :+:                          
echo " +:+  +:+   +:+   +:+  +:+ +:+:+ +:+ +:+    +:+ +:+    +:+      +:+        +:+    +:+  +:+                          
echo "  +#++:+   +#++:++#++: +#+  +:+  +#+ +#++:++#+  +#++:++#+       +#++:++#++ +#+    +:+  +#+                          
echo " +#+  +#+  +#+     +#+ +#+       +#+ +#+        +#+                    +#+ +#+  # +#+  +#+                          
echo "#+#    #+# #+#     #+# #+#       #+# #+#        #+#             #+#    #+# #+#   +#+   #+#                          
echo "###    ### ###     ### ###       ### ###        ###              ########   ###### ### #########              
echo ":::::::::      :::      ::::::::  :::    ::: :::    ::: :::::::::       ::::::::::: ::::::::   ::::::::  :::        
echo ":+:    :+:   :+: :+:   :+:    :+: :+:   :+:  :+:    :+: :+:    :+:          :+:    :+:    :+: :+:    :+: :+:        
echo "+:+    +:+  +:+   +:+  +:+        +:+  +:+   +:+    +:+ +:+    +:+          +:+    +:+    +:+ +:+    +:+ +:+        
echo "+#++:++#+  +#++:++#++: +#+        +#++:++    +#+    +:+ +#++:++#+           +#+    +#+    +:+ +#+    +:+ +#+        
echo "+#+    +#+ +#+     +#+ +#+        +#+  +#+   +#+    +#+ +#+                 +#+    +#+    +#+ +#+    +#+ +#+        
echo "#+#    #+# #+#     #+# #+#    #+# #+#   #+#  #+#    #+# #+#                 #+#    #+#    #+# #+#    #+# #+#        
echo "#########  ###     ###  ########  ###    ###  ########  ###                 ###     ########   ########  #########
echo SCHEDULE: %SC% - %hour%:%mint%
echo:
echo Do you want to...
echo:
echo 1: Add/Show task - 2: Remove task - 3: Change schedule - 4: Make a backup now - 5: Restore last backup 6: Exit  

CHOICE /C:123456
IF ERRORLEVEL 1 SET M=1
IF ERRORLEVEL 2 SET M=2
IF ERRORLEVEL 3 SET M=3
IF ERRORLEVEL 4 SET M=4
IF ERRORLEVEL 5 SET M=5
IF ERRORLEVEL 6 SET M=6
echo:

if %M%==1 (
	goto create
)
if %M%==2 (
	schtasks /delete /tn "MySQL\%SC%_backup"
	pause
	goto continue
) 
if %M%==3 (
	goto :select_schedule
)
::(old)schtasks /change /tn "MySQL\%SC%_backup" /st %hour:~-2%:%mint:~-2% && pause
if %M%==4 (
	start "" /wait mysql_backup
	goto re
)
if %M%==5 (
	start "" /wait mysql_restore
	goto re
)
if %M%==6 
exit

:continue
schtasks /query /tn "MySQL\%SC%_backup" /xml > btask.xml
cls
schtasks /query /tn "MySQL\%SC%_backup"
echo:
echo Current backup task: %SC%
if "%ERRORLEVEL%"=="0" (
	pause
	goto check_mysql
) else goto re
pause
