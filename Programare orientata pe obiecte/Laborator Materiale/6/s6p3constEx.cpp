#include <cstdlib>
#include <iostream>
#include <fstream>
using namespace std;

class pers
{
 const int cnp;
 char nume[10];

public:
pers(int k, char * n=NULL):cnp(k){if (n)strcpy(nume,n); else nume[0]='\0';}
int get_cnp() const {return cnp;}//nc++;// nu pot modifica datele obiectului apelat
void set_n(char *n){strcpy(nume,n);}
const char * get_n()const {return nume;}
};

int main()
{pers *vp[2];
 int nr,c;
 char n[10];
 cin>>nr;
for(int i=0;i<nr;i++)
{cin>>c>>n;
vp[i]=new pers(c,n);
}
return 0;
}




