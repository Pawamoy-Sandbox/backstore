@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP GADGETS AND THEIR CONFIG
XCOPY /S /Y "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows Sidebar" "%DATA%\windows\gadgets"
EXIT 
