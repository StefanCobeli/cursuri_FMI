#include <cstdlib>
#include <iostream>
#include <fstream>
using namespace std;
class C
{public:
    int n;
    const int c;
    C(int p=0):c(p){n=p;};
    int f1(){return c;} // da - intorc o copie
    //int & f2(){return c;}//nu -pot modifica campul const prin ref
    int & f3(){return n;} // da - pot modifica
    const int & f4(){return c;} // da -nu pot modifica const
};

int main()
{

}

