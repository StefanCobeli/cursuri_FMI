#include <cstdlib>
#include <iostream>
#include <fstream>
using namespace std;
class C
{public:
    int n;
    C(int p=0){n=p;};
  
    //int & f1()const{return n;} // !!! this e transmis ca pointer spre zona const -deci n devine const int
    // nu pot initializa referinta cu o zona const -o pot modifica
    const int & f2()const{return n;} // da- intoarce o zona care nu va putea fi modificata
    void f(){}// metoda neconstanta- nu poate fi apelata de obiecte const
};






int main()
{
const C oc;
C o;
 // int & r=oc.n; //nu -pot modifica n const
 const int & rc=oc.n;// da - nu se modifica campul obiectului const
C on; // poate apela met const si neconst

}

