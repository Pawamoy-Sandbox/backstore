TITLE RESTORE VIDEO FOLDER
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video"') DO (
	SET VIDEO=%%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%DATA%\folders\video" "%VIDEO%"
