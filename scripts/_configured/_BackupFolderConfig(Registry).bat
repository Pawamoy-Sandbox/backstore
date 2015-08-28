@ECHO OFF
SET BACKUP=scripts
SET CBACKUP=scripts\_configured
SET DATA=data
SET RESTORE=scripts
SET CRESTORE=scripts\_configured
SET TOOLS=tools
SET APPS=C:\Apps

TITLE BACKUP SPECIAL FOLDERS CONFIGURATION FROM REGISTRY
REG EXPORT "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" "%DATA%\registry\partialbackups\ShellFolders.reg"
REG EXPORT "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "%DATA%\registry\partialbackups\UserShellFolders.reg"
EXIT 
