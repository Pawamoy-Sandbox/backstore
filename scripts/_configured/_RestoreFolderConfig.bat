@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE RESTORE SPECIAL FOLDERS CONFIGURATION TO REGISTRY
REG IMPORT "%DATA%\registry\partialbackups\ShellFolders.reg"
REG IMPORT "%DATA%\registry\partialbackups\UserShellFolders.reg"
EXIT 
