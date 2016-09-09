 /* count_files.c
  * Problema 5:
  * D3. (4 puncte) 
  * Program care primeste ca argumente in linia de comanda un
  *  fisier f si un director d si 
  * determina daca fisierul f se afla (ca nume)
  * in arborescenta cu originea in d; 
  * in caz afirmativ se va determina numarul de aparitii.
  * 
  * Testare, de exemplu cu: file = aa și director = .
  */

#include <dirent.h> 
#include <stdlib.h>
#include <stdio.h> 
#include <unistd.h>
#include <errno.h>

#include <string.h>
/* limits.h defines "PATH_MAX". */
#include <limits.h>

//////////////////////////////////////////////////////////////
/*
 * Funcție de testare a rezultatului așteptat.
 */ 
int numarare_cu_system(char file_name[25], char dir_name[25]){
	DIR *dirp;	
    dirp = opendir(dir_name);
    
    if (dirp == NULL)
    {
  /* could not open directory */
  perror ("");
  printf("Din oarece motive nu pot deschide directorul cu numele %s (explicațiile-s mai sus).\n\n",dir_name);
  return 1;
	}

	printf("Numărăm câte apariții are un fișier într-un director și în subdirectoarele sale.\n");
	printf("\nVerificare:\n\n");
	printf("\n====================================\n");
	system("tree");
	printf("\n====================================\n\n");
	
	
	printf("Numărând cu wc, obținem:\n\n");
	
	setenv("DF", dir_name, 1); // Create environment variable
    setenv("FF", file_name, 1); // Create environment variable

	system("echo -n În directorul $DF sunt exact \" \"; find $DF -name $FF | wc -l; echo fișiere cu numele $FF \n");
    
    unsetenv("FF"); // Clear that variable 
    unsetenv("DF"); // Clear that variable 
	
	printf("\nAm folosit comanda bash: \"find %s -name %s | wc -l\" \n",dir_name, file_name);
	printf("\n====================================\n\n");	
	
	// close directorul
	if (closedir (dirp)) {
        printf ("Nu pot închide directorul %s\n", dir_name);
        exit (EXIT_FAILURE);
        return 1;
    }
	
	return 0;	
	}

////////////////////////////////////////////////////////////////////////////////////
/*
 * Funcție care apelată recursiv va parcurge directorul și va număra fișierele dorite.
 */ 

int numarare_recursiva(char file_name[25], char dir_name[25]){
	//struct dirent *directory;
	DIR *dirp;	
    dirp = opendir(dir_name);
    int nrFilesCautate=0;
    
    // open directorul
    if (dirp == NULL)
    {	
		  /* could not open directory */
		perror ("");
	printf("Din oarece motive nu pot deschide directorul cu numele %s (explicațiile-s mai sus).\n\n",dir_name);
	return 1;
	}
    



/*
		    while ((directory = readdir(dirp)) != NULL)
        {
          printf("%s\n", directory->d_name);
        }
*/

    while (1) {
        struct dirent * entry;
        const char * d_name;

        /* "Readdir" gets subsequent entries from "d". */
        entry = readdir (dirp);
        if (! entry) {
            /* There are no more entries in this directory, so break
               out of the while loop. */
            break;
        }
        d_name = entry->d_name;
        /* Print the name of the file and directory. */
	printf ("%s/%s\n", dir_name, d_name);

#if 0
	/* If you don't want to print the directories, use the
	   following line: */

        if (! (entry->d_type & DT_DIR)) {
	    printf ("%s/%s\n", dir_name, d_name);
	}

#endif /* 0 */


        if (entry->d_type & DT_DIR) {

            /* Check that the directory is not "d" or d's parent. */
            
            if (strcmp (d_name, "..") != 0 &&
                strcmp (d_name, ".") != 0) {
                int path_length;
                char path[PATH_MAX];
 
                path_length = snprintf (path, PATH_MAX,
                                        "%s/%s", dir_name, d_name);
                printf ("%s\n", path);
                if (path_length >= PATH_MAX) {
                    fprintf (stderr, "Path length has got too long.\n");
                    exit (EXIT_FAILURE);
                }
                /* Recursively call "list_dir" with the new path. */
                numarare_cu_system(file_name,path);
            }
	}
    }




	// close directorul
	if (closedir (dirp)) {
        printf ("Nu pot închide directorul %s\n", dir_name);
        exit (EXIT_FAILURE);
        return 1;
    }
	
	return 0;	
	}


/////////////////////////////////////////////////////////////////////////
int main(void)
{
	// introducem datele -- variabilele fun©iilor care vor face socotelile:


    char file_name[25], dir_name[25];
    //int nof;

	//printf("Numărăm câte apariții are un fișier într-un director și în subdirectoarele sale.\n");
	printf("Enter the NAME of the FILE:\n");
	scanf ("%s",file_name);
	printf("Enter the NAME of the DIRECTORY:\n");
	scanf ("%s",dir_name);
	
	//// Apelarea funcției de system care ne va arăta rezultatul așteptat.
	numarare_cu_system(file_name, dir_name);

	//// Calculul efectiv: apelarea funcției recursive care ne va da rezultatul așteptat.
	//numarare_cu_system(file_name, dir_name);
	numarare_recursiva(file_name, dir_name);




    return(0);
}
