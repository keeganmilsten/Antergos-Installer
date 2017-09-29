@echo off
setlocal

REM Create an USB installer for Antergos.
REM Can download Antergos ISO and Rufus (to write ISO to USB).

REM Supported Antergos ISO downloads.
	set urlmini=https://antergos.com/download/antergos-minimal-iso/
	set filemini=antergos-minimal.iso

	set urlfull=https://antergos.com/download/antergos-live-iso/
	set filefull=antergos-live.iso

REM Specify which Antergos ISO version to download.
	set urliso=%urlmini%
	set fileiso=%filemini%

REM Using Rufus to write ISO to USB drive.
	set urlrufus=https://rufus.akeo.ie/downloads/rufus.exe
	set filerufus=rufus-p.exe

REM Download Antergos Minimal ISO and Rufus (if not already there).
	if not exist %filerufus% (
		echo Downloading %filerufus% ...
		powershell -command "& { wget %urlrufus% -OutFile %filerufus% }"
	)
	if not exist %fileiso% (
		echo Downloading %fileiso% ...
		powershell -command "& { wget %urliso% -OutFile %fileiso% }"
	)

REM Run Rufus.
	echo Running %filerufus%
	%filerufus% --gui --iso=%fileiso%

REM Reboot.
	echo Rebooting in 10 seconds ...
	shutdown /r /t 10

endlocal
