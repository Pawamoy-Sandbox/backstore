TITLE RESTORE DOWNLOADS FOLDER
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B}') DO (
	SET DOWNLOADS=%%A %%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%DATA%\folders\downloads" "%DOWNLOADS%"
