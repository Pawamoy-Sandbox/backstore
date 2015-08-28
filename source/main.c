/** \file main.c
 * \brief programme principal
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "backstore.h"

int main (int argc, char* argv[]){
	int _exe, _cnf, _int, _def, _scr, i;
	_exe = _cnf = _int = _def = _scr = 0;

	if (argc<2){
		printf("usage : %s [/c] [/h] [/i] [/n] [/s nom_du_script] [/e nom_de_la_tache]\n", argv[0]);
		printf("utiliser l'option /h pour afficher l'aide\n");
		// LANCER LE MODE INTERACTION
	}
	else{
		_cnf = configure();
		for (i=1; i<argc; i++){
			switch (analyser_argument(argv[i])){
				case _EXE :
					_exe = execute(argv[i+1]);
					i++;
					break;
					
				case _CNF :
					generate();
					break;
					
				case _INT :
					_int = interact();
					break;
					
				case _DEF :
					_def = jobdefine(argv[i+1]);
					i++;
					break;
					
				case _SCR :
					_scr = script(argv[i+1], 0, 1);
					i++;
					break;
					
				case _HLP :
					displayHelp();
					break;
					
				case _NUL :
					printf("Option numero %d incorrecte", i);
					return 1;
					
				case _CST : break;
				default :
					printf("Erreur de syntaxe : option %d", i);
					return 2;
			}
			printf("\n");
		}
	}
	return (_exe + _cnf + _int + _def + _scr);
}


/* CODE DERREURS :
 * 
 * configure -1 - Impossible d'ouvrir config.ini
 * configure * - Nombre d'erreurs pendant lecture du config.ini
 * main 1 - Option incorrecte
 * main 2 - Syntaxe incorrecte
 */
