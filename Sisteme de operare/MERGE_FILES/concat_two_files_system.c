/* Concatenăm 2 fișiere folosind cat (comanda bash) 
 * $ cat file1 file2 > file3 
*/

#include <stdio.h>
#include <stdlib.h>

int main() {
	
   char file_name1[100], file_name2[100], file_name12[100];
//   FILE *fp;
	printf("Enter the name of file1: ");
	scanf ("%s",file_name1);  
	printf("Enter the name of file2: ");
	scanf ("%s",file_name2);
	printf("Enter the name of the merged file: ");
	scanf ("%s",file_name12);
	printf("\nUnirea:\n ");

    setenv("FILE1", file_name1, 1); // Create environment variable
    setenv("FILE2", file_name2, 1); // Create environment variable
    setenv("FILE12", file_name12, 1); // Create environment variable

    system("cat $FILE1 $FILE2 > $FILE12"); // merge operation
    system("echo Am unit $FILE1 și $FILE2 în fișierul $FILE12."); // Echoes when done        

    unsetenv("FILE1"); // Clear that variable 
    unsetenv("FILE2"); // Clear that variable 
    unsetenv("FILE12"); // Clear that variable 

  return 0;
} 
