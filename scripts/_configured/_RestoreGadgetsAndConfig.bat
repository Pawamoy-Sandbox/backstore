@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE RESTORE GADGETS AND THEIR CONFIG
DEL "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows Sidebar"
XCOPY /S /Y "%DATA%\windows\gadgets" "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows Sidebar"
EXIT 
