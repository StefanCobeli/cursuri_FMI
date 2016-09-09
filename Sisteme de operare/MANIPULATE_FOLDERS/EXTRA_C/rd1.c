/*
 *Program care numără aparițiile fișierului file din directorul DIR
 * Exemplu pentru testare: se folosește căutarea lui "aa" în directorul "FA"
 *  
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <dirent.h>
// Sunt multe condiționări ce-ar putea fi verificate/eliminate. De exemplu
// programul se oprește dacă întâlnește directoare fără permisiuni, dar 
// am impus ca să se oprească căutarea dacă arborele e exagerat de mare!!!
/* /usr/include/linux/limits.h defines "PATH_MAX". */
#define PATH_MAX        4096    /* # chars in a path name including nul */
//#include <limits.h>

/* Funcție ce numără și listează fișierele "file_name" din "dir_name". */
int nrFilesCautate=0; //contorul ce numără fișierele căutate
void numar_files(char *file_name, char *dir_name)
{
    DIR *dirp;
    dirp = opendir(dir_name); /* Open the directory specified by "dir_name". */

    /* Check it was opened. */
    if (dirp==NULL) {
        fprintf (stderr, "Nu pot deschide directorul '%s': %s\n",dir_name, strerror (errno));
        printf("STOP: ceva nu merge în directorul '%s'\n",dir_name);
        exit (EXIT_FAILURE); // aici ar trebui lucrat ca să continue când n-are permisiuni!!!
    }
    while (1+1==2) {
        struct dirent *directory;
        char *directory_name;

        /* directory e directorul generic spre care se îndreaptă pointerul dirp */
        directory = readdir (dirp);
        if (! directory) {
            /* Ieșim dacă nu mai sunt alte directoare neverificate */
            break;
        }
        
        directory_name = directory->d_name;
        /* Aici printăm locul în care se găește fișierul căutat!!! */
		if(strcmp (directory_name, file_name)==0){
			printf ("%s/%s\n", dir_name, directory_name);
			// Pentru numarare corectă, din cauza recursivității,
			// variabilala asta e inițializata în afara funcției!!!
			nrFilesCautate++; // și-l numărăm!!!  
		}

        if (directory->d_type & DT_DIR) {

            /* Continui pentru directoarele diferite de . și .., ca să nu cicleze */            
            if (strcmp (directory_name, "..") != 0 && strcmp (directory_name, ".") != 0) {
                int path_length;
                char path[PATH_MAX]; // ne vom opri dacă srborele e exagerat de lung
 
                path_length = snprintf (path, PATH_MAX,"%s/%s", dir_name, directory_name);
                //printf ("%s\n", path); // dacă vrem, printăm locul în care ne găsim
                
                if (path_length >= PATH_MAX) {
                    fprintf (stderr, "Arborele/path e prea mare.\n");
                    exit (EXIT_FAILURE);
                }
                /* Apelăm funcția recursiv!!! // Altfel listam candidații într-o stivă */
                numar_files(file_name,path);
            }
		}
    }
    /* Închidem directorul inițial după ce-am terminat parcurgerea sa. */
    if (closedir (dirp)) {
        fprintf (stderr, "Could not close '%s': %s\n",
                 dir_name, strerror (errno));
        exit (EXIT_FAILURE);
    }
}

int main ()
{
	char file_name[25], dir_name[25];
 	printf("Enter the NAME of the FILE:\n");
	scanf ("%s",file_name);
	printf("Enter the NAME of the DIRECTORY:\n");
	scanf ("%s",dir_name);
	
	
	printf("\n\nFIȘIERELE CĂUTATE SUNT:\n\n");
	
    //numar_files("/tmp/kde-cristi/");
    //numar_files("aa", "FA");
    //numar_files("aa", ".");
    
    numar_files(file_name, dir_name);
    //printez rezultatul
    printf("\n\nRĂSPUNS:\nNumărul aparițiilor fișierului \"%s\" în directorul \"%s\" este %d!!!\n\n",file_name, dir_name,nrFilesCautate);
    return 0;
}

