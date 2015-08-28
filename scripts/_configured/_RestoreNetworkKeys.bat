@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE RESTORE NETWORK KEYS WITH WIRELESSKEYVIEW
"%TOOLS%\wirelesskeyview\wirelesskeyview-x64.exe" /import "%DATA%\windows\NetworkKeys.txt"
EXIT 
