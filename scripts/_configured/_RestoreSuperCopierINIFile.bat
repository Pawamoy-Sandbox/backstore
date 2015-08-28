@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE RESTORE SUPER COPIER INI FILE
IF EXIST "%DATA%\appconfig\supercopier\SuperCopier2.ini" (
	COPY /Y "%DATA%\appconfig\supercopier\SuperCopier2.ini" "C:\Program Files (x86)\SuperCopier"
)
EXIT 
