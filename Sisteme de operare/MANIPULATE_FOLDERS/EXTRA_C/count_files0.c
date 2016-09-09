 /* count_files0.c
  * Problema 5:
  * D3. (4 puncte) 
  * Program care primeste ca argumente in linia de comanda un
  *  fisier f si un director d si 
  * determina daca fisierul f se afla (ca nume)
  * in arborescenta cu originea in d; 
  * in caz afirmativ se va determina numarul de aparitii.
  */

#include <dirent.h> 
#include <stdlib.h>
#include <stdio.h> 
#include <unistd.h>


int main(void)
{
    DIR *dirp;
    struct dirent *directory;
    char file_name[25], dir_name[25];
    //int nof;

	printf("Numărăm câte apariții are un fișier într-un director și în subdirectoarele sale.\n");
	printf("Enter the NAME of the FILE:\n");
	scanf ("%s",file_name);
	printf("Enter the NAME of the DIRECTORY:\n");
	scanf ("%s",dir_name);
	
	
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
	
	///////////////////////////////////////////////	
    dirp = opendir(dir_name);
    
    if (dirp != NULL)
    {
		printf("\nFolderele și fișierele din %s sunt:\n",dir_name);
        while ((directory = readdir(dirp)) != NULL)
        {
          printf("%s\n", directory->d_name);
        }

        closedir(dirp);
    }
    else 
    {
  /* could not open directory */
  perror ("");
  //printf("Nu pot deschide directorul cu numele %s pentru că el nu există.\n\n",directory->d_name);
  printf("Din oarece motive nu pot deschide directorul cu numele %s (explicațiile-s mai sus).\n\n",dir_name);
  return 1;
}

    return(0);
}

