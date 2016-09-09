 /* list_files.c
  * http://stackoverflow.com/questions/23212000/get-the-list-of-files-in-a-directory-with-in-a-directory?lq=1
  * code using opendir() and readdir()
  * adaptare/adăugare
  */

#include <dirent.h> 
#include <stdio.h> 

int main(void)
{
    DIR *dirp;
    struct dirent *directory;
    char dir_name[25];
//   FILE *fp;

	printf("Enter the name of the directory\n");
	// gets(dir_name); // 'gets' function is dangereous and should not be used!!!
	scanf ("%s",dir_name);
	
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


