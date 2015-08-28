@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP SPECIAL FOLDERS CONFIGURATION FROM REGISTRY
REG EXPORT "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" "%DATA%\registry\partialbackups\ShellFolders.reg"
REG EXPORT "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "%DATA%\registry\partialbackups\UserShellFolders.reg"
EXIT 
