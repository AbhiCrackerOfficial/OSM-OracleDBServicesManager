@echo off
mode 70,18 
set "TAB=   " 

:: Check if the script is running with administrative privileges
>nul 2>&1 "%SYSTEMROOT%\system32\icacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
  echo Requesting administrative privileges...
  goto UACPrompt
) else (
  goto menu
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /b

:menu
mode 70,18
title OSM By Abhi Cracker
color a
cls
:::                       _______ _______ _______ 
:::                      |       |     __|   |   |
:::                      |   -   |__     |       |
:::                      |_______|_______|__|_|__|
:::                                                  
for /f "delims=: tokens=*" %%I in ('findstr /b ::: "%~f0"') do @echo(%%I
echo ===================== OracleDB Services Manager ======================
echo ========================== By Abhi Cracker ===========================
echo.
echo %TAB%%TAB%%TAB%%TAB%%TAB%%TAB%1. Start OracleDB Services
echo %TAB%%TAB%%TAB%%TAB%%TAB%%TAB%2. Stop OracleDB Services
echo %TAB%%TAB%%TAB%%TAB%%TAB%%TAB%3. Exit Manager
@REM echo %TAB%>>> 
set /p option="%TAB%%TAB%>>> "

if "%option%"=="1" (
  cls
  color 9
  title Initializing...
  for /f "tokens=2" %%a in ('sc query state^= all ^| findstr /i /c:"SERVICE_NAME: Oracle"') do (
	cls    
	echo Starting service: %%a
    net start %%a
)
cls
  echo ALL SERVICES HAS BEEN STARTED SUCCESSFULLY !!
  echo Opening SQL PLUS
  start cmd \k sqlplus
timeout 3 > nul
goto menu


) else if "%option%"=="2" (
  cls
  color 4
  title Terminating...
  for /f "tokens=2 delims=: " %%a in ('sc query^| findstr /R /C:"^SERVICE_NAME: Oracle"') do (
    cls
    echo Stopping service: %%a
    net stop %%a
)
cls
  echo ALL SERVICES HAS BEEN TERMINATED SUCCESSFULLY !!
timeout 3
goto menu

) else if "%option%"=="3" (
  cls
  color 6
  echo Thank you for using OSM. Support me on Github by giving stars:
  echo https://github.com/AbhiCrackerOfficial
  echo If you are getting any issues Report it on Github
  start msedge https://github.com/AbhiCrackerOfficial
  timeout 10 >nul
  pause
) else (
  cls
  echo Invalid option. Please enter 1 - 2 - 3 
  timeout 1
  goto menu
)

