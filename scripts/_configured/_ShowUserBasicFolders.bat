@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE SHOW USER SPECIAL FOLDERS
SET COLOR="%TOOLS%\txtcolor\TXTCOLOR.exe"

REM Téléchargements
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement des telechargements :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B}') DO (
	ECHO %%A
	ECHO.
)

REM Bibliothèques
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement des bibliotheques :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}') DO (
	ECHO %%A
	ECHO.
)

REM Mes Documents
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement des documents :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal') DO (
	ECHO %%A
	ECHO.
)

REM Mes Images
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement des images :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures"') DO (
	ECHO %%B
	ECHO.
)

REM Ma Musique
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement de la musique :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music"') DO (
	ECHO %%B
	ECHO.
)

REM Mes Vidéos
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement des videos :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video"') DO (
	ECHO %%B
	ECHO.
)

REM Menu SendTo
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement du menu SendTo :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v SendTo') DO (
	ECHO %%A
	ECHO.
)

REM Menu Démarrer
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement du menu demarrer :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Startup') DO (
	ECHO %%A
	ECHO.
)

REM Favoris
%COLOR% 0A 1 "==============================="
%COLOR% 0F 1 "Emplacement des favoris :"
%COLOR% 0A 1 "==============================="
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Favorites') DO (
	ECHO %%A
	ECHO.
)

PAUSE
EXIT 
