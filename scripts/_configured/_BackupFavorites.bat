@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP FAVORITES FOLDER
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Favorites') DO (
	SET FAVORITES=%%A %%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%FAVORITES%" "%DATA%\folders\favorites"
EXIT 
