TITLE BACKUP SUPER COPIER INI FILE
IF EXIST "C:\Program Files (x86)\SuperCopier\SuperCopier2.ini" (
	COPY /Y "C:\Program Files (x86)\SuperCopier\SuperCopier2.ini" "%DATA%\appconfig\supercopier"
)
