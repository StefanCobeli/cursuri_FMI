#include <iostream>
#include <fstream>
#include <queue>
using namespace std;
int n,i,j,a[100][100],viz[100],st,fi,t[100],d[100];
queue <int> c;
fstream f ("intrare.txt");
int main()
{  f>>n;
   for (i=1;i<=n;i++)
   {
       viz[i]=0;
       for (j=1;j<=n;j++)
        f>>a[i][j];
   }
   f.close();
   cout<<"dati nodul de start ";
   cin>>st;
   viz[st]=1;
   t[st]=-1;
   d[st]=0;
   c.push(st);
   cout<<"dati nodul final ";
   cin>>fi;
   d[fi]=-1;
   while(!c.empty())
   {
       i=c.front();
       c.pop();
       for (j=1;j<=n;j++)
        if (a[i][j]==1)
        if (viz[j]==0)
       {
           viz[j]=1;
           d[j]=d[i]+1;
           t[j]=i;
           c.push(j);
       }
   }
   if (d[fi]>=0)
   {
       cout<<"distanta de la nodul "<<st<<" la nodul "<<fi<<" este "<<d[fi]<<endl;
       if (st==fi) cout<<"lantul e format dintr-un singur nod: "<<st<<endl;
       else {cout<<"lantul e format din: "<<fi<<"-";
       while (t[fi]>0)
       {
           cout<<t[fi];
           fi=t[fi]; if (t[fi]>0) cout<<"-";
       }
       }
   } else cout<<"Nu exista drum intre cele doua noduri";
}
