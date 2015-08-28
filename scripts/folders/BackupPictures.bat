TITLE BACKUP PICTURES FOLDER
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures"') DO (
	SET PICTURES=%%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%PICTURES%" "%DATA%\folders\pictures"
