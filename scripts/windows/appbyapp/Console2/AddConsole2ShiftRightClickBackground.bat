TITLE ADD OPEN CONSOLE2 TABS IN REGISTRY
REM PRECONDITIONS :
REM Installer Console2 | Copier Console2 (version portable) dans C:\Apps
REM Configurer 4 onglets "cmd", "cygwin", "powershell", "msys"

REM Script d'ajout des options
REM Ouvrir Cmd
REM Ouvrir Cygwin
REM Ouvrir PowerShell
REM Ouvrir MSYS
REM dans le menu contextuel des dossiers (background, shift+clicdroit)

REM Si Console.exe existe dans C:\Apps\Console2\App :
IF EXIST C:\Apps\Console2\App\Console.exe (
	SET CONSPATH=\"C:\\Apps\\Console2\\App\\Console.exe\"
REM Sinon si Console.exe existe dans C:\Program Files\Console2 :
) ELSE IF EXIST "C:\Program Files\Console2\Console.exe" (
	SET CONSPATH=\"C:\\Program Files\\Console2\\Console.exe\"
REM S'il n'existe ni dans l'un ni dans l'autre :
) ELSE (
	ECHO Console.exe est introuvable dans "C:\Apps\Console2\App",
	ECHO ni d'ailleurs dans "C:\Program Files\Console2".
	PAUSE
	GOTO :END
)

ECHO Windows Registry Editor Version 5.00 > consoleregistry.reg
ECHO. >> consoleregistry.reg
REM Préparation de l'ajout de "Ouvrir Cmd"
ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir Cmd] >> consoleregistry.reg
ECHO @="Ouvrir Cmd" >> consoleregistry.reg
ECHO "Extended"="" >> consoleregistry.reg
ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir Cmd\command] >> consoleregistry.reg
ECHO @="%CONSPATH% -t cmd -d \"%%V\"\\" >> consoleregistry.reg

REM Si Cygwin existe dans C:
IF EXIST C:\Cygwin (
	REM Préparation de l'ajout de "Ouvrir Cygwin"
	ECHO. >> consoleregistry.reg
	ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir Cygwin] >> consoleregistry.reg
	ECHO @="Ouvrir Cygwin" >> consoleregistry.reg
	ECHO "Extended"="" >> consoleregistry.reg
	ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir Cygwin\command] >> consoleregistry.reg
	ECHO @="%CONSPATH% -t cygwin -r \"/bin/xhere /bin/bash.exe '%%V'\"" >> consoleregistry.reg
REM Ou si cygwin existe dans C:
) ELSE IF EXIST C:\cygwin (
	REM Préparation de l'ajout de "Ouvrir Cygwin"
	ECHO. >> consoleregistry.reg
	ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir Cygwin] >> consoleregistry.reg
	ECHO @="Ouvrir Cygwin" >> consoleregistry.reg
	ECHO "Extended"="" >> consoleregistry.reg
	ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir Cygwin\command] >> consoleregistry.reg
	ECHO @="%CONSPATH% -t cygwin -r \"/bin/xhere /bin/bash.exe '%%V'\"" >> consoleregistry.reg
REM Sinon message d'erreur :
) ELSE (
	ECHO Aucune installation de Cygwin trouvee dans C:
	PAUSE
)

REM Préparation de l'ajout de "Ouvrir PowerShell"
ECHO. >> consoleregistry.reg
ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir PowerShell] >> consoleregistry.reg
ECHO @="Ouvrir PowerShell" >> consoleregistry.reg
ECHO "Extended"="" >> consoleregistry.reg
ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir PowerShell\command] >> consoleregistry.reg
ECHO @="%CONSPATH% -t powershell -d \"%%V\"\\" >> consoleregistry.reg

REM Si MSYS existe dans C:
IF EXIST C:\MSYS (
	REM Préparation de l'ajout de "Ouvrir MSYS"
	ECHO. >> consoleregistry.reg
	ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir MSYS] >> consoleregistry.reg
	ECHO @="Ouvrir MSYS" >> consoleregistry.reg
	ECHO "Extended"="" >> consoleregistry.reg
	ECHO [HKEY_CLASSES_ROOT\Directory\Background\shell\Ouvrir MSYS\command] >> consoleregistry.reg
	ECHO @="%CONSPATH% -t msys" >> consoleregistry.reg
REM Sinon message d'erreur :
) ELSE (
	ECHO Aucune installation de MSYS trouvee dans C:
	PAUSE
)

REM Lancement du fichier .reg généré :
regedit.exe /s consoleregistry.reg
REM Attente de validation

REM Suppression du fichier temporaire
DEL consoleregistry.reg

:END
