@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

:: ATTENTION !!!
:: doubledriver ne fonctionne pas comme souhaité lorsqu'utilisé avec des chemins relatifs
:: Si un chemin relatif est utilisé, le programme créera les dossiers dans la racine de la partition courante
TITLE BACKUP DRIVERS WITH DOUBLEDRIVER
"%TOOLS%\doubledriver\ddc.exe" b /target:"%DATA%\drivers"
EXIT 
