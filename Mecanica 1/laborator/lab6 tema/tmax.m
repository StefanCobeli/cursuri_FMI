clear all
date;
a=0.1;
b=1000;
c=(a+b)/2;
A=a;
B=b;
C=c;
for i=1:61
    
    if f(A)*f(C)<=0
    B=C;
    C=(A+B)/2;
    else
    A=C;
    C=(A+B)/2;
    end
    if abs(f(C))< exp(-100)
        disp (C);
        disp(f(C));
        break;
        return;
    end
    
end