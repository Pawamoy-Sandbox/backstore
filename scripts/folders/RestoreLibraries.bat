TITLE RESTORE LIBRARIES FOLDER (CONFIG)
FOR /F "tokens=3* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v {1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}') DO (
	SET LIBRARIES=%%A %%B
)

"%TOOLS%\scripts\BackstoreFolder.bat" "%DATA%\folders\libraries" "%LIBRARIES%"
