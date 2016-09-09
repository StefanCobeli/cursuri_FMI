 /* pipe_problem.c
  * Problema 4:
  * A14. (2 puncte) Scrieti niste programe care arata daca fii obtinuti cu system
  * ai unui proces "p" mostenesc redirectarile intrari/iesirii standard care au
  * loc daca lansam "p" in cadrul unui filtru:
  * ... | p | ...
  */

#include <dirent.h> 
#include <stdlib.h>
#include <stdio.h> 
#include <unistd.h>


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




    return(0);
}
