@ECHO OFF
SET BACKUP=C:\Apps\Backstore\scripts
SET CBACKUP=C:\Apps\Backstore\scripts\_configured
SET DATA=C:\Apps\Backstore\data
SET RESTORE=C:\Apps\Backstore\scripts
SET CRESTORE=C:\Apps\Backstore\scripts\_configured
SET TOOLS=C:\Apps\Backstore\tools
SET APPS=C:\Apps

TITLE BACKUP PORTABLE APPS
SET OUT=%DATA%\portableapps\portableapps.7z
"%TOOLS%\nircmd\nircmdc-x64.exe" elevate "%TOOLS%\7z\7z.exe" a -t7z -m0=LZMA2 -mmt=on -mx7 -md=32m -mfb=64 -ms=4g -sccUTF-8 "%OUT%" "%APPS%"
EXIT 
