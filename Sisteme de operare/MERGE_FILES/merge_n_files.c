// merge_n_files.c 
// ./merge_n_files f1 f2 f3 ff
// merge f1,..., fn into ff

#include <stdio.h>
#include <stdlib.h>
 
int main(int argc, char** argv) {
	char ch;
	int k;
	FILE *f1p, *ffp; 

   if( argc<=2 )
   {
	  printf("Run with %s f1 f2 ... fn ff.\n",argv[0]);
      perror("Error: exit 1!!!!!\n\n\n Wait for ");
      exit(EXIT_FAILURE);
   }  

    ffp = fopen(argv[argc-1],"w"); //  write mode;  all_files_merged	
   if( ffp == NULL )
   {
      perror("You need at least 2 arguments: at least one to merge into the last listed.\n");
      exit(EXIT_FAILURE);
      return 1;
   }    
    
    for(k=1; k <= argc-2; k++){
		f1p = fopen(argv[k],"r"); // read mode; file to be merged  
		while( ( ch = fgetc(f1p) ) != EOF ){
			fprintf(ffp, "%c", ch);
		}   
		fclose(f1p);
	}
	fclose(ffp);
	return 0;
}

