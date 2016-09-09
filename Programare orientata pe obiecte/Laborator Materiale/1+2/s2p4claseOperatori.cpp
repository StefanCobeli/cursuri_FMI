#include <cstdlib>
#include <iostream>
#include <cmath>
using namespace std;

class Complex
{
      float re,im;
public:
     Complex(){im=0; }
     Complex (int r){re=r;im=0;}
     Complex(int r,int i){re=r;im=i;}
     Complex operator+(Complex p2);
     friend Complex operator+(float i,Complex p2 );
     Complex operator = (Complex p);
     friend istream & operator>>(istream & i, Complex &o);
     friend ostream & operator<<(ostream & o, Complex o);
     float & operator[](int i);
     //operator float(){return sqrt(re*re+im*im);}
};

Complex Complex :: operator + (Complex p2)
{ Complex ol;
   ol.re=re+p2.re; // ol.re=(*this).re +p2.re;
   ol.im=im+p2.im;
  return ol;
 }

Complex operator + (float r, Complex p2)
{Complex ol;
  ol.re=r+p2.re;
  ol.im=p2.im;
   return ol;
}
Complex Complex:: operator=(Complex p)
{re=p.re;
 im=p.im;
return (*this);}

istream & operator >>(istream & i, Complex &op)
{ i>>op.re>>op.im;
  return i;
}
ostream & operator <<(ostream & out, Complex op)
{ out<<op.re<<op.im;
  return out;
}

 float & Complex :: operator[](int i)
{if(i==0) return re;
  return im;}

int main()
{ Complex C1, C2(1,2), C3(2,3);
   C1+C2; // se poate gandi ca C1.+(C2)
   C1+2;
   2+C2; // se poate gandi ca +(2,C2)
   C1=C2=C3;
   cin>>C1;
   C1[0]=2;C1[1]=3;
   //int a=C1;
}


