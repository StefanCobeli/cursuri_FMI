#include <cstdlib>
#include <iostream>
#include <fstream>
using namespace std;

int main()
{
    int i;
try{
    cin>>i;
    if (i) throw 2;
    cout<<"dupa if";
    }
catch(double a){cout<<a;} // nu face conversie
//catch(int a){cout<<a;}
//catch(...){cout<<" toate tipurile"}
 cout<<"dupa catch";

}
