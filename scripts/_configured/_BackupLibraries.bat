@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP LIBRARIES FOLDER (CONFIG)
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}') DO (
	SET LIBRARIES=%%A%%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%LIBRARIES%" "%DATA%\folders\libraries"
EXIT 
