TITLE BACKUP FAVORITES FOLDER
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Favorites') DO (
	SET FAVORITES=%%A %%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%FAVORITES%" "%DATA%\folders\favorites"
