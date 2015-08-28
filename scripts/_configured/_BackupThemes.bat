@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP THEMES
COPY /Y "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Themes\Custom.theme" "%DATA%\windows\themes"
XCOPY /E /Y "%WINDIR%\Resources\Themes" "%DATA%\windows\themes"
EXIT 
