@ECHO OFF
SET BACKUP=scripts
SET CBACKUP=scripts\_configured
SET DATA=data
SET RESTORE=scripts
SET CRESTORE=scripts\_configured
SET TOOLS=tools
SET APPS=C:\Apps

TITLE RESTORE SPECIAL FOLDERS CONFIGURATION TO REGISTRY
REG IMPORT "%DATA%\registry\partialbackups\ShellFolders.reg"
REG IMPORT "%DATA%\registry\partialbackups\UserShellFolders.reg"
EXIT 
