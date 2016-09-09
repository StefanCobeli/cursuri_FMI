#include <cstdlib>
#include <iostream>
#include <fstream>
//se apeleaza mai intai clasa mostenita virtual
using namespace std;
class B{public: B(){cout<<" B ";}};
class Dv1: virtual public B{public:Dv1(){cout<<" Dv1 ";}};
class Dv2: virtual public B{public:Dv2(){cout<<" Dv2 ";}};
class C{public:C(){cout<<" C ";}};
class E: public C,public Dv1,public Dv2{};
int main()
{E oe;
}
