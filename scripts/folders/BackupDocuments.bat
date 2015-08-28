TITLE BACKUP DOCUMENTS FOLDER
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal') DO (
	SET DOCUMENTS=%%A %%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%DOCUMENTS%" "%DATA%\folders\documents"
