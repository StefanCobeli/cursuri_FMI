#include <cstdlib>
#include <iostream>
using namespace std;
class complex
{
    public:
  double re,im;
    complex adunare(complex);
} ;
   complex complex:: adunare(complex y)
   {
       complex t;
       t.re=re+y.re;
       t.im=im+y.im;
       return t;
   }

int main()
{
    complex A,B,C;
    A.re=0;A.im=0;B.re=1;B.im=2;
    C=A.adunare(B);
    cout<<C.re<<" + i"<<C.im;
    return 0;
}


