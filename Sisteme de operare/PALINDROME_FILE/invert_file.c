/* invert.c
 * ./invert file
 * Action: reverses the order of characters of file 
 * without using an auxilliary file.
 * Se vede bine dacă file nu se termină cu "\n"
 * Exemplu" abc 123456789 xyz <---> zyx 987654321 cba
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
	
    int ch, nc=0, k; // nc = number of characters of the file
    FILE *ifp;

/* The number of parameters should be 2 and the only argument following */
/* the name of the program is the name of the input file. */

  if (argc != 2)
    {
      fprintf (stderr, "Usage: invert file\n");
      exit (1);
    }

/* Open the input file. */
  if ((ifp = fopen (argv[1], "r+")) == NULL)
    {
      fprintf (stderr, "Could not open file: %s\n", argv[1]);
      exit (1);
    }
       
    while ((ch=fgetc(ifp)) != EOF){
		nc++;
		printf("nc=%d, iar ch=%c\n",nc,ch);
	}
    
    printf("\nThe file has %d characters.\n\n",nc);
    
    /////////////////////////////////////////
    // nc obținut altfel:

	fseek(ifp, 0L, SEEK_END);
	size_t fileSize = ftell(ifp);
	printf("\nAltfel:\nThe file has %d characters.\n\n",fileSize);
	// "rewind" the file back to the beginning after you've learned the size:
	fseek(ifp, 0L, SEEK_SET);
   
    /////////////////////////////////////////
    // Inversarea ordinii caracterelor    
    /* 
     * testare
    k=2;
    fseek (ifp, k, SEEK_SET);	// Go to the character whose offset is k 
    char *h;
    h="abg";
    fputs(h,ifp);
    fputs("8",ifp);
    */
    
    int c1,c2;
    for (k=0; k<nc/2; k++){
		fseek (ifp, k, SEEK_SET);	// Go to the character whose offset is k
		c1=fgetc(ifp);
		fseek (ifp, -(k+1), SEEK_END);	// Go to the END character whose offset is k+1
		c2=fgetc(ifp);
		printf("c1=%c, iar c2=%c\n",c1,c2);
		
		char buffer[16]; // folosim un buffer pentru convertirea 
		sprintf(buffer, "%c", c2);
		// int sprintf(char *str, const char *format, ...) sends formatted output to a string pointed to by str.
		fseek (ifp, k, SEEK_SET);	// Go to the character whose offset is k
		//int fputs ( const char * str, FILE * stream ); definiția din manual 
		fputs(buffer,ifp);
		fseek (ifp, -(k+1), SEEK_END);	// Go to the END character whose offset is k+1
		sprintf(buffer, "%c", c1);
		fputs(buffer,ifp);
	}
    
/* Close the input file. */
    if (fclose (ifp) == EOF)
    {
      fprintf (stderr, "Could not close file: %s\n", argv[1]);
    }
  return 0;
} 
