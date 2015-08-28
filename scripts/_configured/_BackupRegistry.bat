@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP ENTIER REGISTRY
REGEDIT /E %TEMP%\REGBAK.reg
MV %TEMP%\REGBAK.reg "%DATA%\registry\totalbackup"
EXIT 
