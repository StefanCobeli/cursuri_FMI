clear all
date;
a=0.1;
b=1000;
c=(a+b)/2;
A=a;
B=b;
C=c;
for i=1:80
    
    if f_deriv(A)*f_deriv(C)<=0
    B=C;
    C=(A+B)/2;
    else
    A=C;
    C=(A+B)/2;
    end
    if abs(f_deriv(C))< exp(-100)
        disp (C);
        disp(f_deriv(C));
        break;
        return;
    end
    
end