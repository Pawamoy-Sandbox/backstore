@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE RESTORE PORTABLE APPS
"%TOOLS%\nircmd\nircmdc-x64.exe" elevate "%TOOLS%\7z\7z.exe" e -o"%APPS%" "%DATA%\portableapps\portableapps.7z"
EXIT 
