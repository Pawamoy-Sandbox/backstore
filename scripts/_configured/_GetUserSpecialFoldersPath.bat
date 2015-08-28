@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE GET USER SPECIAL FOLDERS
SET COLOR="%TOOLS%\txtcolor\TXTCOLOR.exe"

REM Téléchargements
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B}') DO (
	ECHO Downloads=%%A %%B > SPECIALFOLDERS.TXT
	ECHO.
)

REM Bibliothèques
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}') DO (
	ECHO Libraries=%%A %%B >> SPECIALFOLDERS.TXT
	ECHO.
)

REM Mes Documents
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal') DO (
	ECHO Documents=%%A %%B >> SPECIALFOLDERS.TXT
	ECHO.
)

REM Mes Images
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures"') DO (
	ECHO Pictures=%%B >> SPECIALFOLDERS.TXT
	ECHO.
)

REM Ma Musique
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music"') DO (
	ECHO Music=%%B >> SPECIALFOLDERS.TXT
	ECHO.
)

REM Mes Vidéos
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video"') DO (
	ECHO Video=%%B >> SPECIALFOLDERS.TXT
	ECHO.
)

REM Menu SendTo
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v SendTo') DO (
	ECHO Sendto=%%A %%B >> SPECIALFOLDERS.TXT
	ECHO.
)

REM Menu Démarrer
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Startup') DO (
	ECHO Startup=%%A %%B >> SPECIALFOLDERS.TXT
	ECHO.
)

REM Favoris
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Favorites') DO (
	ECHO Favorites=%%A %%B >> SPECIALFOLDERS.TXT
	ECHO.
)
EXIT 
