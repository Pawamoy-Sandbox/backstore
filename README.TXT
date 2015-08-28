::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::: BACKSTORE - BACKUP & RESTORE :::::::::::::::::::::::
:::::: Auteur : Timothée Mazzucotelli :::::::::::::::::::::::::::::::::::::::::::::::::::
:::::: Licence : / :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::: Version : 1.0 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



******************************************************************
* DESCRIPTION *														 *
******************************************************************

Backstore - Backup & Restore est un mélange entre fichier exécutables (programme C compilé : backstore.exe)
et scripts batch (interpréteur natif de windows : cmd.exe), permettant une certaine portabilité et facilité d'utilisation.
Le programme principal backstore.exe récupère des variables (des chemins) dans le fichier config.ini,
et les réécrit/définit en langage batch dans des scripts configurés, auxquels il ajoute le contenu original et générique
du script correspondant, contenu dans un dossier de votre choix. Il permet également de créer des tâches, ou 
une suite de scripts exécutés dans un certain ordre.



******************************************************************
* USAGE *																 *
******************************************************************

backstore.exe [/c] [/h] [/i] [/n] [/s nom_du_script] [/e nom_de_la_tache]

	/e ou -e
		Exécute un ensemble de script (job) donné en paramètre immédiatement après /e
	/c ou -c
		Génère des scripts configurés d'après les scripts génériques (contenus dans backup et restore)
		et les variables contenues dans config.ini
	/i ou -i
		Interaction avec l'utilisateur
	/n ou -n
		Permet de définir un nouveau job
	/s ou -s
		Exécute un script unique (dans une nouvelle fenêtre)
	/h ou -h ou /? ou -?
		Affiche l'aide du programme
			
Sans paramètres, le programme affiche sa syntaxe et la commande pour afficher l'aide,
puis lance le mode interaction avec quelques aides (en développement).
	
Chaque partie des arguments du programme est exécutée dans l'ordre
Exemple : backstore.exe /c /n monJob /e monJob
-> configure et génère les scripts, définit un nouveau job "monJob" et l'exécute tout de suite après
	
	
	
******************************************************************
* PRECISIONS *														 *
******************************************************************

Il est possible de choisir où placer :
	- les scripts génériques de sauvegarde (backup)
	- les scripts configurés de sauvegarde (cbackup)
	- les scripts génériques de restoration (restore)
	- les scripts configurés de restoration (crestore)
	- les données sauvegardées (data)
	- les outils utilisés par les scripts (tools)

Il est possible de fournir ces emplacements en donnant des variables d'environnement (%APPDATA%, %USERNAME%, ...)
Vous pouvez également écrire ces chemins de dossiers entre guillemets (double-quotes), ou non, cela ne change rien.
Si le fichier config.ini est vide, incomplet, ou que les valeurs sont vides, alors les variables de chemins seront
initialisées à leur valeur par défaut, c'est à dire C:\Apps pour les applications portables, scripts pour backup et restore,
scripts\_configured pour les scripts configurés, data pour les données, et tools pour les outils.
Ces 6 dernières valeurs sont des chemins relatifs, il faudra donc que les dossiers correspondants soient dans le même dossier
que le répertoire courant depuis lequel est lancé l'exécutable backstore.exe, pour que cela fonctionne.
(Attention : avec cette méthode de chemins relatifs, les scripts ne seront pas autonomes, donc ne fonctionneront pas si lancés via double-clic.
De plus, certains des outils utilisés par les scripts peuvent ne pas fonctionner correctement avec des chemins relatifs.)

Si les valeurs de "Backup" et "Restore" sont identiques, alors TOUS les scripts configurés seront automatiquement
générés dans "ConfiguredBackup" (car impossible de différencier les scripts de sauvegarde des scripts de restoration).



******************************************************************
* SCRIPTS *																 *
******************************************************************

Les variables suivantes peuvent être utilisées dans vos scripts (!! ne pas les définir !!)
en plus de vos variables et des variables d'environnement (%APPDATA%, ...)
- %BACKUP%
- %CBACKUP%
- %RESTORE%
- %CRESTORE%
- %DATA%
- %TOOLS%
- %PORTABLEAPPS%

Il s'agit des variables récupérées dans config.ini
Tout script en dehors des dossiers de backup et restore ne sera pas configuré.

Astuces : si vous créez un script qui en utilise un autre, et que ce 2eme script n'a pas besoin d'être configuré,
placez-le ailleurs que dans les dossiers des scripts génériques, afin qu'il ne soit pas configuré pour rien.
Par contre, si le 2eme script a besoin d'être configuré, alors vous devrez fournir (dans le 1er script) son nom,
sous cette forme : "%CBACKUP%\_NomDuScript.bat" ou "%CRESTORE%\_NomDuScript.bat"
Notez bien l'underscore (tiret-bas, ou "_") en début du nom de fichier : le programme ajoute automatiquement un underscore au nom du fichier de base.
Pour un script qui boucle (qui s'appelle lui-même), ayant besoin d'être configuré, vous pouvez utilisez la syntaxe "_%0.bat",
%0 étant le nom du script en cours d'interprétation (donc lui-même).

Vos scripts doivent être encodés en UTF-8 (sans BOM).
En ASCII, les lettres avec accents (et autres caractères spéciaux) seront corrompues.
Vous devez pour chaque script ajouter un saut de ligne à la fin (pour l'ajout de la commande EXIT pendant la configuration).
Par conséquent, vous pouvez vous abstenir d'ajouter vous-même la commande EXIT en fin de script.
Même si vous le faites, cela n'empêchera pas le bon fonctionnement du script (toute commande après EXIT n'est pas exécutée).
Pensez à ajouter la commande PAUSE à la fin des scripts nécessitant un appui clavier de l'utilisateur pour se terminer (script de rappels/aide).
La commande @ECHO OFF est automatiquement ajoutée en début de chaque script.
Pensez à utiliser TITLE pour donner un nom plus explicite à l'invite de commande lors de l'exécution d'un script.
N'utilisez pas de parenthèses dans les noms de vos scripts ! CMD.EXE n'aime pas beaucoup.

Rappel du modèle des scripts :

	[ TITLE "Titre de la fenêtre" ]
	commande 1
	commande 2
	...
	commande N

	[ PAUSE ]
	<!! LIGNE VIDE !!>


Attention, si vous lancez une tâche exécutant un script qui MODIFIE la LARGEUR/HAUTEUR de la fenêtre,
via la commande "MODE CON COLS=XX LINES=YY",  DANS LA FENÊTRE COURANTE, il se peut que la barre de défilement (scrollbar)
disparaisse. C'est un problème de buffer de CMD.EXE. Seul certaines dimensions permettent de le garder.



******************************************************************
* TACHES *																 *
******************************************************************

La syntaxe des jobs doit suivre les quelques règles suivantes :
- le job commence toujours par un crochet ouvrant, suivi d'un chemin, puis d'un crochet fermant
	cela sert à dire au programme ou doivent être cherché les scripts
	les variables habituelles peuvent également être utilisées : CBACKUP, CRESTORE,
	DATA, TOOLS, BACKUP, RESTORE, APPS
- toute ligne ne commencant pas par un crochet ou un dièse (commentaire) est lue et exécutée dans CMD
- on peut ajouter des attributs d'exécution à chaque ligne grâce à un double-point
	wait = lancer le script et attendre qu'il soit terminé pour continuer
	new window = lancer le script dans une nouvelle fenêtre
	+ = lancer le script dans une nouvelle fenêtre maximisée
	- = lancer le script dans une nouvelle fenêtre réduite
	hidden = lancer le script de manière invisible (instance de cmd.exe tout de même visible dans les processus)
	Ces attributs peuvent être combinés.
	Le programme ne lit que la première lettre après un double-point, et n'est pas sensible à la casse,
	donc il est possible d'écrire seulement w, n, h, W, N ou H
	L'ordre n'est pas pris en compte (:w:+ = :+:w)
- on peut redéfinir autant de fois que voulu où le programme doit chercher les scripts
	en reprécisant [CBACKUP] ou [CRESTORE] (sur une seule ligne entière)
	Défini pour toutes les lignes du dessous jusqu'au prochain [...]
	
Exemple :

	[H:\Backstore\scripts\_configured]
	_ReminderProgramFiles.bat:New
	[CRESTORE]
	_ShowAllUserFolders.bat:w:hidden
	_Script19874.bat
	[CBACKUP]
	_ShowUserBasicFolders.bat:Wait:n



