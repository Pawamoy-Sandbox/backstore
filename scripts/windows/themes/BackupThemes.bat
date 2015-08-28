TITLE BACKUP THEMES
COPY /Y "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Themes\Custom.theme" "%DATA%\windows\themes"
XCOPY /E /Y "%WINDIR%\Resources\Themes" "%DATA%\windows\themes"
