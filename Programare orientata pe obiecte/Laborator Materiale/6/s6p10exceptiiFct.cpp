#include <cstdlib>
#include <iostream>
#include <fstream>
using namespace std;
void f()
{int i;
 cin>>i;
 if (i) throw 2;
 cout<<"dupa throw";
}

int main()
{
try{
    f();
    cout<<"dupa f";
   }
catch(double a){cout<<"catch "<<a;} // nu face conversie
catch(int a){cout<<"catch "<<a;}
//catch(...){cout<<" toate tipurile"}
 cout<<"dupa catch";

}
