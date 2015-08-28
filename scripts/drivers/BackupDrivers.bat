:: ATTENTION !!!
:: doubledriver ne fonctionne pas comme souhaité lorsqu'utilisé avec des chemins relatifs
:: Si un chemin relatif est utilisé, le programme créera les dossiers dans la racine de la partition courante
TITLE BACKUP DRIVERS WITH DOUBLEDRIVER
"%TOOLS%\doubledriver\ddc.exe" b /target:"%DATA%\drivers"
