/** \file backstore.h
 * \brief définition des constantes, prototypes et doc des fonctions
 */

 #ifndef __BACKSTORE_H
#define __BACKSTORE_H

// paramètres du programme
#define _EXE 0
#define _CNF 1
#define _INT 2
#define _NUL 3
#define _CST 4
#define _DEF 5
#define _SCR 6
#define _HLP 7

// chaque variable a un numéro fixe
#define BACKUP 0
#define DATA 1
#define RESTORE 2
#define TOOLS 3
#define APPS 4
#define CBACKUP 5
#define CRESTORE 6

/**
 * \fn int analyser_argument(const char* arg)
 * \brief analyse des arguments donnés en paramètres du programme
 * \param arg un des arguments du programme
 * \return un entier (code de retour)
 */
int analyser_argument(const char* arg);

/**
 * \fn int defaultpath(const char* chaine)
 * \brief teste si une chaîne de caractères est vide
 * \param a chaine la chaîne à tester
 * \return un entier (1:vide;0 sinon)
 */
int defaultpath(const char* chaine);

/**
 * \fn void setdefault(int num)
 * \brief met à défaut la variable de configval
 * \param num l'indice dans le tableau configval
 */
void setdefault(int num);

/**
 * \fn void verification()
 * \brief teste pour chaque chaine de configval si elle est vide et l'initialise à défaut si oui
 */
void verification();

/**
 * \fn void getconfig(FILE* conf, int num)
 * \brief sous-arbre gauche
 * \param conf pointeur de fichier
 * \param num indice dans le tableau configval
 */
void getconfig(FILE* conf, int num);

/**
 * \fn int configure(
 * \brief récupération des chemins dans config.ini
 * \return un entier (code de retour)
 */
int configure();

/**
 * \fn void generate()
 * \brief utilise les variables de configval pour générer les scripts configurés à partir de ceux de base
 */
void generate();

/**
 * \fn int execute(char* job)
 * \brief sous-arbre gauche
 * \param job le fichier à ouvrir
 * \return un entier (code de retour)
 */
int execute(char* job);

/**
 * \fn int interact()
 * \brief fonction permettant l'interaction avec l'utilisateur
 * \return un entier (code de retour)
 */
int interact();

/**
 * \fn int jobdefine(char* job)
 * \brief définition d'une nouvelle tâche (ou job)
 * \param job le nom du nouveau fichier
 * \return un entier (code de retour)
 */
int jobdefine(char* job);

/**
 * \fn int script(const char* file, int wait, int newWindow)
 * \brief lance un script selon des paramètres d'exécution
 * \param file le nom du script à exécuter
 * \param wait active ou non la fonction d'attente entre script
 * \param newWindow active ou non le lancement d'une nouvelle fenêtre 
 * \return un entier (code de retour)
 */
int script(const char* file, int wait, int newWindow);

/**
 * \fn void displayHelp()
 * \brief affiche l'aide du programme
 */
void displayHelp();

#endif // __BACKSTORE_H
