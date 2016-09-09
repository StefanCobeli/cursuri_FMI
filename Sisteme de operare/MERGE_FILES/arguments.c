// gcc arcuments.c -o arguments
//Running it :
//cristi@debian:~/projects/MERGE_FILES$ ./arguments a b c
//We have 4 arguments. 
//These are:
//./arguments 
//a 
//b 
//c



#include<stdio.h>

int main(int argc, char** argv) {
	printf("We have %d arguments. \nThese are:\n%s \n%s \n%s \n%s\n\n", argc, argv[0], argv[1], argv[2],argv[3]);
//    std::cout << "You have " << argc << " arguments. These are:" << std::endl;
//    for (int i = 0; i < argc; ++i) {
//        std::cout << argv[i] << std::endl;
//    }
 return 0;
}

