#include <cstdlib>
#include <iostream>
using namespace std;
class B
{
public:
     int x=7;
    virtual void a(){cout<<x;}
        void fnv(){cout<<"B nevirttuala\n";}
         // evaluare la compilare
         virtual void fv(){cout<<"B virtuala\n";}
        //evaluare la executie-obiectul are un pointer suplimentar  .......
        void fGenerala(){fnv();fv();}
         // evaluare la compilare a fnv din B dar evaluare la executie a fv prin pointerul suplimentar ......
};
class D: public B
{
public:
    int x=3;
        void fnv(){cout<<"D nevirtuala";}
         void fv(){cout<<"D virtuala";}    //ramane virtuala daca are acelasi tip intors si aceiasi parametrii
        void fs(){cout<<"f suplimentara";}

};
int main()
{
    D d;
    B b;
    b.a();
    d.fGenerala();
    return 0;
}
/*
int main(int argc, char *argv[])
{
 D od;
od.fnv();// evaluare la compilare alege varianta din D
od.fv();// evaluare la executie alege varianta din D
od.fGenerala() ; // apeleaza fnv din B -evaluare la compilare dar fv din D -evaluare la executie


 B *pb=new D; // in pointer la BAZA pot pune adresa unui obiect din DERIVATA
// pb->fs();  pb nu vede decat membrii din clasa B -fs nu e vizibil prin  pointerul pb
pb->fnv(); //alege la compilare varianta corespunzatoare din clasa B
pb->fv(); // alege la executie varianta corespunzatoare   obiectului clasei D
pb-> fGenerala(); // va alege la compilare fnv din clasa de baza
                            //va alege la  executie   fv din clasa derivatei
 B &rb=od; // referinta la BAZA poate referi un obiect din DERIVATA
// rb.fs();  pb nu vede decat membrii din clasa B -fs nu e vizibil prin  pointerul pb
rb.fnv(); //alege la compilare varianta corespunzatoare din clasa B
rb.fv(); // alege la executie varianta corespunzatoare   obiectului clasei D
rb. fGenerala(); // va alege la compilare fnv din clasa de baza
                            //va alege la  executie   fv din clasa derivatei


B *v[2];
v[0]=new B; v[1]=new D ; //pot avea  vector de elemente de pointeri la tipuri diferite
for(int i=0;i<2;i++) v[i]->fGenerala();  // va alege la compilare functia fnv din clasa B si la executie fv() din clasa corespunzatoare fiecarui obiect
            system("PAUSE");
    return 0;
}
*/
