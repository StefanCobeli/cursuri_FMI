/* check the values of $PWD and of getcwd before and after changes
 * getcwd - get the pathname of the current working directory
 * #include <unistd.h>
 * getcwd(char *buf, size_t size);
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
	
    char dirname[100];
    int PATH_MAX=200;
    // In the begining:
    system("echo Directorul inițial este: $PWD");  
    printf("Aici suntem la început.\n\n");
    
	/* To be passed to getcwd system call. */
	/* Use getcwd to get the name of the current working directory. */
	if (getcwd(dirname, PATH_MAX) == NULL) {
		fprintf(stderr, "Could not obtain current working directory.\n");
		exit(1);
	}
	else {
		printf("Altfel, verificăm folosind getcwd(): \nDirectorul inițial este: %s\n", dirname);
	}
	
	printf("\n==============================================\n");
    // After:
    // system("ls -1");
    system("export PWD=/tmp; echo Directorul schimbat este: PWD=$PWD");
    printf("\nComanda PWD=/tmp funcționează din linia de comandă și schimbă directorul!!!\n");
    system("echo Cu system însă, dacă mai întreb încă o dată: PWD=$PWD");  
    system("pwd");
    system("echo Deci nu s-a schimbat nimic!!!\n\n");  


    printf("\n");	
	system("echo Altă încercare, folosind setenv");
    setenv("PWD", "/tmp", 1); // Create environment variable

	/* To be passed to getcwd system call. */
	/* Use getcwd to get the name of the current working directory. */
	if (getcwd(dirname, PATH_MAX) == NULL) {
		fprintf(stderr, "Could not obtain current working directory.\n");
		exit(1);
	}
	else {
		printf("\nSe verifică neschimbarea și cu getcwd(): \nPWD=%s\n", dirname);
	}
	
	/////////////////////////////////////
	// Altfel
	printf("\n==============================================\n");
	char cwd[1024];
	printf("\n\nSchimbăm acum directorul în /tmp folosind C-command: chdir");
    chdir("/tmp"); // directory to change to
    getcwd(cwd, sizeof(cwd));
    printf("\nVerificare: PWD=: %s\n", cwd);
    
    printf("\n\nVerificare dublă:\nLa comanda ls obținem:\n\n");
    system("ls");
    printf("\n");
    system("echo iar directorul curent este: $PWD\n");


  return 0;
} 
