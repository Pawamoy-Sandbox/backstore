@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP SUPER COPIER INI FILE
IF EXIST "C:\Program Files (x86)\SuperCopier\SuperCopier2.ini" (
	COPY /Y "C:\Program Files (x86)\SuperCopier\SuperCopier2.ini" "%DATA%\appconfig\supercopier"
)
EXIT 
