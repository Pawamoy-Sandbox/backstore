TITLE BACKUP SENDTO FOLDER
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v SendTo') DO (
	SET SENDTO=%%A%%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%SENDTO%" "%DATA%\folders\sendto"
