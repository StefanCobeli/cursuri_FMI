// concat_two_files.c 
// read 2 files and write one after the other
// Nice presentations of working with files
// http://www.dirac.org/linux/programming/tutorials/files_in_C/

// $ gcc cfile.c -o cfile
// sau
// $ gcc cfile.c // la mine nu merge asa
// sau 
// $ gcc -lstdc++ cfile.c -o cfile
// cu editorul geany se compile-build-run la clicks

/*
fopen modes
 The allowed modes for fopen are as follows: 
r  - open for reading
w  - open for writing (file need not exist)
a  - open for appending (file need not exist)
r+ - open for reading and writing, start at beginning
w+ - open for reading and writing (overwrite file)
a+ - open for reading and writing (append if file exists)
*/

#include <stdio.h>
#include <stdlib.h>
 
int main()
{
   char ch, file_name1[100], file_name2[100], file_concat[100];
   FILE *fp1, *fp2, *fp12;
 
   printf("Enter the name of file1\n");
   gets(file_name1);
   printf("Enter the name of file2\n");
   gets(file_name2);
   printf("Enter the name of fileUnite\n");
   gets(file_concat);   
   fp1 = fopen(file_name1,"r"); // read mode
   fp2 = fopen(file_name2,"r"); // read mode
   //fp12 = fopen(file_concat,"r+"); // read+write mode; nu crează newfilw dacă nu exista
    fp12 = fopen(file_concat,"w"); // write mode; 
// if the file exists, its contents are overwritten and 
// if the file does not exist, it will be created

   if( fp1 == NULL )
   {
      perror("Error while opening file1.\n");
      exit(EXIT_FAILURE);
   }
   if( fp2 == NULL )
   {
      perror("Error while opening file2.\n");
      exit(EXIT_FAILURE);
   } 
       if (fp12 == NULL) {
         printf("I couldn't open results.dat for writing.\n");
         exit(0);
      }

   printf("The contents of files %s and %s is :\n", file_name1, file_name2);
 
   while( ( ch = fgetc(fp1) ) != EOF ){
      printf("%c",ch);
      fprintf(fp12, "%c", ch);
  }
   while( ( ch = fgetc(fp2) ) != EOF ){
      printf("%c",ch);
      fprintf(fp12, "%c", ch);
   }   
   fclose(fp1); fclose(fp2); fclose(fp12);
   return 0;
}

