#include <cstdlib>
#include <iostream>
// exemplu pentru conversie int la C<int> in f mb si f friend
using namespace std;

template <class T>
//int k;
class C
{ T i;
//  Y y;
public:
C(T p){i=p;}
void f(C<T> p){i=p.i;}
template <class T1> friend void ff(C<T1> );


};

template <class T>
void ff(C<T> p){cout<<p.i;}


int main(int argc, char *argv[])
{
C<double> o(1);
o.f(2); //metoda functioneaza functioneaza -creaza un obiect din clasa deja selectata de obiectul o C<int>
//ff(2); // functia externa nu functioneaza-nu stie catre ce clasa sa aleaga -parametrul ar trebui sa fie de tip C<T>
ff((C<double>)2); // functioneaza
system("PAUSE");
    return 0;
}

