/*  gcc cat.c 
 * cat file and then concatenate 2 files
*/

#include <stdio.h>
#include <stdlib.h>

int main() {
	
   char ch, file_name[25];
//   FILE *fp;

	printf("Enter the name of file you wish to see\n");
	gets(file_name);

    setenv("VAR1", file_name, 1); // Create environment variable
//    system("echo $VAR1"); // Outputs name of 1st file
//    unsetenv("VAR1"); // Clear that variable (optional)

  system("cat $VAR1");
  return 0;
} 
