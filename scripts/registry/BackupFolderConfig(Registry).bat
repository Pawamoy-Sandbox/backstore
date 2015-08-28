TITLE BACKUP SPECIAL FOLDERS CONFIGURATION FROM REGISTRY
REG EXPORT "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" "%DATA%\registry\partialbackups\ShellFolders.reg"
REG EXPORT "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "%DATA%\registry\partialbackups\UserShellFolders.reg"
