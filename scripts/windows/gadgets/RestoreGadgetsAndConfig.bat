TITLE RESTORE GADGETS AND THEIR CONFIG
DEL "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows Sidebar"
XCOPY /S /Y "%DATA%\windows\gadgets" "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows Sidebar"
