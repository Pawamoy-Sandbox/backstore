@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP VIRTUAL BOX XML USER FILE
COPY /Y "C:\Users\%USERNAME%\.VirtualBox\VirtualBox.xml" "%DATA%\appconfig\virtualbox"
EXIT 
