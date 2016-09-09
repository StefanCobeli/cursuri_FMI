/* workWith_fseek.c
 * CSI 402 – Systems Programming
 * Illustrating the use of fseek, ftell and rewind
 * Handout 2.1
 * The following program uses the functions 
 * fseek, ftell and rewind to move around in an input
 * ﬁle speciﬁed by the command line argument argv[1].
 * Input: abcdefghijklmno\n
Output:
a
f
6
j
10
g
7
l
12
a
1
*/

/* To illustrate the use of fseek and ftell */
#include <stdio.h>
#include <stdlib.h>
int main (int argc, char *argv[])
{
  FILE *ifp;		/* Input file pointer. */
  long pos;			/* To obtain positions using ftell. */
  int c;			/* To read characters from input file. */

/* The number of parameters should be 2 and the only argument following */
/* the name of the program is the name of the input file. */

  if (argc != 2)
    {
      fprintf (stderr, "Usage: ftest file\n");
      exit (1);
    }
/* Open the input file. */
  if ((ifp = fopen (argv[1], "r")) == NULL)
    {
      fprintf (stderr, "Could not open file: %s\n", argv[1]);
      exit (1);
    }

  c = fgetc (ifp);
  printf ("%c\n", c);		/* Print the first character (offset = 0) in file. */
  
/* In the following, for simplicity, we don’t do any error checks. */

  fseek (ifp, 5L, SEEK_SET);
  c = fgetc (ifp);
  printf ("%c\n", c);		/* Print the character with offset = 5 from the beginning. */
  pos = ftell (ifp);
  printf ("%ld\n", pos);	/* Print the file offset. */
  fseek (ifp, 3L, SEEK_CUR);	/* Go to the character whose offset is 3 plus */
  c = fgetc(ifp); /* the current offset, read that character and */
  printf("%c\n", c); /* print it. */
  pos = ftell(ifp); printf("%ld\n", pos); /* Also print offset. */

  fseek (ifp, -4L, SEEK_CUR);	/* Go to the character whose offset is 4 less */
  c = fgetc (ifp); /* than the current position, read that */
  printf ("%c\n", c); /* character and print it. */
  pos = ftell (ifp);
  printf ("%ld\n", pos);
  
  
  fseek (ifp, -5L, SEEK_END);	/* Go to the character whose offset is 5 less */
  c = fgetc (ifp); /* than the end of file, read that */
  printf ("%c\n", c); /* character and print it. */
  pos = ftell (ifp);
  printf ("%ld\n", pos);
  
  
/* Get to the beginning of the file. */
  rewind (ifp);
  c = fgetc (ifp); /* Read the character at offset = 0 */
  printf ("%c\n", c); /* and print it. */
  pos = ftell (ifp);
  printf ("%ld\n", pos);


/* Close the input file. */
    if (fclose (ifp) == EOF)
    {
      fprintf (stderr, "Could not close file: %s\n", argv[1]);
    }
  return 0;
}				
/* End of main. */
