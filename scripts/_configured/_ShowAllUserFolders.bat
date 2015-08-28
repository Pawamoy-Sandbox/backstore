@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE SHOW ALL USER FOLDERS
SET COLOR="%TOOLS%\txtcolor\TXTCOLOR.exe"

%COLOR% 0A 1 "==========================================="
%COLOR% 0F 1 "Emplacement des dossiers de l'utilisateur :"
%COLOR% 0A 1 "==========================================="
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"

PAUSE

%COLOR% 0A 1 "==========================================="
%COLOR% 0F 1 "Emplacement des dossiers independement de l'utilisateur :"
%COLOR% 0A 1 "==========================================="
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"

PAUSE
EXIT 
