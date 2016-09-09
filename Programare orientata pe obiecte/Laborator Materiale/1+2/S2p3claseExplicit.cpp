#include <cstdlib>
#include <iostream>
using namespace std;

class Complex
{
      float re,im;
public:
     Complex(){im=0; cout << "constructor de initializare fara parametrii "<<endl;}
     Complex(int r){re=r;im=0;cout<<"constructor de initializare  cu un parametru"<<endl;}
     Complex(int r,int i){re=r;im=i;cout<<"constructor de initializare cu parametrii"<<endl;}
     Complex(const Complex & o)  {re=o.re; im=o.im; cout<< "constructor de copiere"<<endl;}
    ~Complex (){cout<<"destructor"<<endl;}

};

void f1(Complex op){cout<<"functie cu parametru transmis prin valoare"<<endl;}
void f2(Complex & op){cout<<"functie cu parametru transmis prin referinta"<<endl;}
Complex f3(){Complex ol; cout<<"functie cu rezultat intors ca valoare"<<endl; return ol;}


int main()
{  Complex C1;
   Complex C2(1),C3=2;
   Complex C4(1,2);
   Complex *p;
   cout<<"alocare dinamica"<<endl;
   p= new Complex;
   p=new Complex(1);
   p=new Complex(1,2);
   cout<<"alocare vector"<<endl;
  Complex v[2];
  Complex v1[2]={Complex(1),Complex(2)};
  Complex v2[2]={Complex(1,2),Complex(2,3)};

   Complex C5=C1;
   p=new Complex(C1);
   C2=C1;
{Complex C6;}
    delete p;
    cout<<"apel functie cu parametru transmis prin valoare"<<endl;
    f1(C1);
    cout<<"apel functie cu parametru transmis prin referinta"<<endl;
    f2(C1);
    cout<<"apel functie cu rezultatul transmis prin valoare"<<endl;
    f3(); // ar trebui sa afiseze apelul constructorului de copiere
    return 0;
}


