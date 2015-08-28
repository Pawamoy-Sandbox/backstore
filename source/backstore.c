/** \file backstore.c
 * \brief fonctions du programme
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "backstore.h"

// nombre de variables dans config.ini
#define CONFIGSIZE 7
// nombre de car. max pour chaque variable
#define CARMAX 200
// tableau des valeurs des variables de config.ini
static char configval[CONFIGSIZE][CARMAX];

/************************************************************/
/****** FONCTION D'ANALYSE DES ARGUMENTS DU PROGRAMME *******/
/************************************************************/

int analyser_argument(const char* arg){
	if (arg[0]=='-' || arg[0]=='/'){
		switch(arg[1]){
			case 'c' : return _CNF;
			case 'e' : return _EXE;
			case 'i' : return _INT;
			case 'n' : return _DEF;
			case 's' : return _SCR;
			case '?' : return _HLP;
			case 'h' : return _HLP;
			default : return _NUL;
		}
	}
	else return _CST;
}

/************************************************************/
/***** FONCTIONS DE LECTURE DU FICHIER DE CONFIGURATION *****/
/************************************************************/

int defaultpath(const char* chaine){
	if (chaine[0] == '\0') return 1;
	else return 0;
}

void setdefault(int num){
	switch(num){
		case BACKUP :
			sprintf(configval[num], "scripts");
			break;
		case CBACKUP :
			sprintf(configval[num], "scripts\\_configured");
			break;
		case DATA :
			sprintf(configval[num], "data");
			break;
		case RESTORE :
			sprintf(configval[num], "scripts");
			break;
		case CRESTORE :
			sprintf(configval[num], "scripts\\_configured");
			break;
		case TOOLS :
			sprintf(configval[num], "tools");
			break;
		case APPS :
			sprintf(configval[num], "C:\\Apps");
			break;
		default : break;
	}
	return ;
}

void verification(){
	int i;
	for (i=0; i<CONFIGSIZE; i++) if (defaultpath(configval[i])) setdefault(i);
	return ;
}
	
void getconfig(FILE* conf, int num){
	char car;
	int k=0;
	do car=fgetc(conf);
	while (car != '=');
	do {
		car=fgetc(conf);
		if (car != '"'){
			configval[num][k] = car;
			k++;
		}
	}
	while (car != '\n' && car != EOF);
	configval[num][k-1] = '\0';
	return;
}

int configure(){
	FILE* conf = fopen("config.ini", "r");
	int err=0;
	char car;
	if (conf != NULL){
		do{
			car=fgetc(conf);
			switch (car) {
				case 'b' :
				case 'B' :
					getconfig(conf, BACKUP);
					break;
					
				case 'c' :
				case 'C' :
					while((car=fgetc(conf))!='d');
					car=fgetc(conf);
					switch(car) {
						case 'B' :
						case 'b' :
							getconfig(conf, CBACKUP);
							break;
							
						case 'R' :
						case 'r' :
							getconfig(conf, CRESTORE);
							break;
						
						default :
							err++;
							break;
					}
					break;
					
				case 'd' :
				case 'D' :
					getconfig(conf, DATA);
					break;
					
				case 'p' :
				case 'P' :
					getconfig(conf, APPS);
					break;
				
				case 'r' :
				case 'R' :
					getconfig(conf, RESTORE);
					break;
					
				case 't' :
				case 'T' :
					getconfig(conf, TOOLS);
					break;
				
				case '[' :
					do car=fgetc(conf);
					while (car != '\n');
					break;
				case '#' :
					do car=fgetc(conf);
					while (car != '\n');
					break;
				case '\n' : break;
				case EOF : break;
				default :
					err++;
					break;
			}
		}
		while (car != EOF);
		fclose(conf);
		
		verification();	
	}
	else{
		printf("Impossible d'ouvrir le fichier config.ini en mode lecture\n");
		return -1;
	}
	return err;
}

/************************************************************/
/********** LES DIFFERENTES OPTIONS DU PROGRAMME ************/
/************************************************************/

void generate(){
	char command[300];
	char call[250];
	int eg = strcmp(configval[BACKUP], configval[RESTORE]);
	int i;
	FILE* liste;
	FILE* temp;
		
	sprintf(call, "CALL \"%s\\scripts\\Generer.bat\"", configval[TOOLS]);
	
	sprintf(command, "%s DELC \"%s\"", call, configval[CBACKUP]);
	system(command);
	sprintf(command, "%s LIST \"%s\" \"%s\"", call, configval[CBACKUP], configval[BACKUP]);
	system(command);
	sprintf(command, "%s CLIST \"%s\"", call, configval[CBACKUP]);
	system(command);	
	
	// OUVERTURE DE LA LISTE DES SCRIPTS CONFIGURES DE BACKUP
	sprintf(command, "%s\\CSLIST.TXT", configval[CBACKUP]);
	if ((liste = fopen(command, "r")) != NULL){
		// LECTURE DE LA LISTE
		while((fgets(command, 300, liste)) == command){
			for (i=0; i<300; i++) if (command[i] == '\n') command[i] = '\0';
			// CREATION DES FICHIERS ET ECRITURE DES VARIABLES
			if ((temp = fopen(command, "w")) != NULL){
				fprintf(temp, "@ECHO OFF\nSET BACKUP=%s\nSET CBACKUP=%s\nSET DATA=%s\nSET RESTORE=%s\nSET CRESTORE=%s\nSET TOOLS=%s\nSET APPS=%s\n\n", configval[BACKUP], configval[CBACKUP], configval[DATA], configval[RESTORE], configval[CRESTORE], configval[TOOLS], configval[APPS]);
				fclose(temp);
			}
		}
		fclose(liste);
	}
	
	sprintf(command, "%s ADD \"%s\"", call, configval[CBACKUP]);
	system(command);
	sprintf(command, "%s EX \"%s\"", call, configval[CBACKUP]);
	system(command);
	sprintf(command, "%s DELTMP \"%s\"", call, configval[CBACKUP]);
	system(command);
	
	// SI REPERTOIRES DIFFERENTS ENTRE BACKUP ET RESTORE :
	if (eg != 0){
		sprintf(command, "%s DELC \"%s\"", call, configval[CRESTORE]);
		system(command);
		sprintf(command, "%s LIST \"%s\" \"%s\"", call, configval[CRESTORE], configval[RESTORE]);
		system(command);
		sprintf(command, "%s CLIST \"%s\"", call, configval[CRESTORE]);
		system(command);	
		
		// OUVERTURE DE LA LISTE DES SCRIPTS CONFIGURES DE BACKUP
		sprintf(command, "%s\\CSLIST.TXT", configval[CRESTORE]);
		if ((liste = fopen(command, "r")) != NULL){
			// LECTURE DE LA LISTE
			while((fgets(command, 300, liste)) == command){
				for (i=0; i<300; i++) if (command[i] == '\n') command[i] = '\0';
				// CREATION DES FICHIERS ET ECRITURE DES VARIABLES
				if ((temp = fopen(command, "w")) != NULL){
					fprintf(temp, "@ECHO OFF\nSET BACKUP=%s\nSET CBACKUP=%s\nSET DATA=%s\nSET RESTORE=%s\nSET CRESTORE=%s\nSET TOOLS=%s\nSET APPS=%s\n\n", configval[BACKUP], configval[CBACKUP], configval[DATA], configval[RESTORE], configval[CRESTORE], configval[TOOLS], configval[APPS]);
					fclose(temp);
				}
			}
			fclose(liste);
		}
		
		sprintf(command, "%s ADD \"%s\"", call, configval[CRESTORE]);
		system(command);
		sprintf(command, "%s EX \"%s\"", call, configval[CRESTORE]);
		system(command);
		sprintf(command, "%s DELTMP \"%s\"", call, configval[CRESTORE]);
		system(command);
	}	
	return;
}

int execute(char* job){
	char command[200];
	char str[100];
	char find[100];
	char car;
	int f, k;
	int wait, window;
	FILE* tache = fopen(job, "r");
	if (tache != NULL) {
		// on boucle tant qu'on a pas atteint la fin du fichier
		do {
			k=0;
			wait=0;
			window=0;
			// pour chaque ligne
			do {
				car=fgetc(tache);
				// début de ligne
				if (k==0) {
					// si premier caractère = [
					if (car == '[') {
						f=0;
						do {
							car = fgetc(tache);
							find[f] = car;
							f++;
						}
						while (car != ']');
						if (find[f-2] == '\\') find[f-2] = '\0';
						else find[f-1] = '\0';
						// on va jusqu'à la fin de la ligne
						do car = fgetc(tache);
						while(car != '\n' && car != EOF);
					}
					// si premier caractère = #
					else if (car == '#'){
						do car = fgetc(tache);
						while(car != '\n' && car != EOF);
					}
					else if (car == '\n') ;
					// premier caractère quelconque
					else {
						str[k] = car; 
						k++;
					}
				}
				// pas début de ligne
				else {
					if (car == ':') {
						do {
							// wait ou new window
							car = fgetc(tache);
							switch(car) {
								case 'W' :
								case 'w' :
									wait=1;
									// on se déplace jusqu'au prochain double-point ou saut de ligne
									do car = fgetc(tache);
									while(car != '\n' && car != EOF && car != ':');
									break;
								case 'n' :
								case 'N' :
									window=1;
									do car = fgetc(tache);
									while(car != '\n' && car != EOF && car != ':');
									break;
								case '-' :
									window=2;
									do car = fgetc(tache);
									while(car != '\n' && car != EOF && car != ':');
									break;
								case '+' :
									window=3;
									do car = fgetc(tache);
									while(car != '\n' && car != EOF && car != ':');
									break;
								case 'H' :
								case 'h' :
									window=4;
									do car = fgetc(tache);
									while(car != '\n' && car != EOF && car != ':');
									break;
								// sinon rien
								default : break;
							}
						}
						while (car == ':');
					}
					// caractère quelconque, différent de ':'
					else {
						str[k] = car; 
						k++;
					}
				}
			}
			while (car != '\n' && car != EOF && k<100);
			// on n'appelle pas la fonction script si fin du fichier atteinte
			if (k>0) {
				if (str[k-1] != EOF) {
					if (str[k-1] == '\n') str[k-1] = '\0';
					else str[k]='\0';
					if ((strcmp(find, "CBACKUP"))==0) sprintf(command, "%s\\%s", configval[CBACKUP], str);
					else if ((strcmp(find, "CRESTORE"))==0) sprintf(command, "%s\\%s", configval[CRESTORE], str);
					else if ((strcmp(find, "BACKUP"))==0) sprintf(command, "%s\\%s", configval[BACKUP], str);
					else if ((strcmp(find, "RESTORE"))==0) sprintf(command, "%s\\%s", configval[RESTORE], str);
					else if ((strcmp(find, "TOOLS"))==0) sprintf(command, "%s\\%s", configval[TOOLS], str);
					else if ((strcmp(find, "DATA"))==0) sprintf(command, "%s\\%s", configval[DATA], str);
					else if ((strcmp(find, "APPS"))==0) sprintf(command, "%s\\%s", configval[APPS], str);
					else sprintf(command, "%s\\%s", find, str);
					script(command, wait, window);
				}
			}
		}
		while (car != EOF);
		fclose(tache);
		return 0;
	}
	else {
		printf("Fichier %s non-trouve. Arret de la tache.\n", job);
		return 1;
	}	
}

int interact(){
	printf("\nInteraction avec l'utilisateur (en developpement).\n");
	return 0;
}

int jobdefine(char* job){
	printf("\nCreation d'une nouvelle tache (en developpement).\n");
	return 0;
	
}

int script(const char* file, int wait, int window){
	// window :
	// 0 = fenêtre courante
	// 1 = nouvelle fenêtre normale
	// 2 = nouvelle fenêtre réduite
	// 3 = nouvelle fenêtre maximisée
	// 4 = nouvelle fenêtre invisible
	char commande[300];
	char cmd[13] = "CMD /C";
	char start[6] = "START";
	char b[3] = "/B";
	char min[5] = "/MIN";
	char max[5] = "/MAX";
	char w[6] = "/WAIT";
	switch (window) {
		case 0 :
			if (wait) sprintf(commande, "%s %s %s %s %s", cmd, start, b, w, file);
			else sprintf(commande, "%s %s %s %s", cmd, start, b, file);
			break;
		case 1 :
			if (wait) sprintf(commande, "%s %s %s %s", cmd, start, w, file);
			else sprintf(commande, "%s %s %s", cmd, start, file);
			break;
		case 2 :
			if (wait) sprintf(commande, "%s %s %s %s %s", cmd, start, min, w, file);
			else sprintf(commande, "%s %s %s %s", cmd, start, min, file);
			break;
		case 3 :
			if (wait) sprintf(commande, "%s %s %s %s %s", cmd, start, max, w, file);
			else sprintf(commande, "%s %s %s %s", cmd, start, max, file);
			break;
		case 4 :
			sprintf(commande, "%s\\he\\he.exe %s", configval[TOOLS], file);
			break;
		default : 
			printf("Erreur de parametre dans la fonction script, 'window' : %d", window);
			break;
	}
	printf("*** Execution du script %s\n", file);
	system(commande);
	//~ printf("\n\n");
	return 0;
}

void displayHelp(){
	printf("\n******* BACKSTORE - Backup & Restore *******\n");
	printf("\nProgramme de configuration et lancement automatise de scripts\n");
	printf("(Sauvegarde et restoration)\n");
	printf("\nOPTIONS DISPONIBLES :\n");
	printf("Chaque option doit etre precedee d'un slash ou d'un tiret (/ ou -)\n");
	printf("\tc : le programme recupere tous vos scripts (config.ini->backup/restore)\n");
	printf("\t    et leur ajoute les variables contenues dans config.ini\n");
	printf("\t    pour les rendre autonomes (generes dans config.ini->cbackup/crestore)\n");
	printf("\ts : le programme execute un script donne en parametre juste apres l'option s\n");
	printf("\te : le programme execute une tache (plusieurs scripts dans un certain ordre)\n");
	printf("\t    Ces scripts sont donnes dans un fichier texte que le programme lit\n");
	printf("\tn : permet de definir une nouvelle tache\n");
	printf("\ti : lance le mode d'interaction avec l'utilisateur\n");
	printf("\th : affiche cette aide et quitte le programme\n");
	return;
}

