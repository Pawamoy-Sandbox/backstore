TITLE BACKUP STARTUP FOLDER
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Startup') DO (
	SET STARTUP=%%A %%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%STARTUP%" "%DATA%\folders\startup"
