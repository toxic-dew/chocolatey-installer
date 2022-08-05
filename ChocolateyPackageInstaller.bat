ECHO OFF
CLS
:MENU0
CLS
TITLE CholateyInstaller
color 0a
ECHO.
ECHO ........................................................................
ECHO                       How do you want to install
ECHO ........................................................................
ECHO.
ECHO 1 - With Commands Prompt 
ECHO 2 - With Powershell
ECHO 3 - With Powershell throught Command prompt
ECHO.
ECHO In some pc Cholatey fails to install by command prompt .... 
ECHO So if one fails try another.....
SET /P M=Type 1, 2, 3, or 4 then press ENTER: 
IF %M%==1 GOTO CMD
IF %M%==2 GOTO PWRSHL
IF %M%==3 GOTO CMDPWR
IF %M%==4 GOTO EOF
	:CMD
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"	@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
	GOTO MENU0
	:PWRSHL
	Set-ExecutionPolicy AllSigned
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	GOTO MENU0
	:CMDPWR
	SET DIR=%~dp0%

	::download install.ps1
	%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('https://chocolatey.org/install.ps1','%DIR%install.ps1'))"
	::run installer
	%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%DIR%install.ps1' %*"
	GOTO MENU0
