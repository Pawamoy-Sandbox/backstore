TITLE RESTORE SUPER COPIER INI FILE
IF EXIST "%DATA%\appconfig\supercopier\SuperCopier2.ini" (
	COPY /Y "%DATA%\appconfig\supercopier\SuperCopier2.ini" "C:\Program Files (x86)\SuperCopier"
)
