date;
t=linspace(0,1.2281, 100);
x=(v0*cos(u0)*(1-exp(-g*k^2.*t)))/(k^2*g);
y=-t./(k^2)+(v0*sin(u0)+1/k^2)*(1-exp(-g*k^2.*t))/(g*k^2);
plot(x,y)
title('Traiectorie cu rezistenta')
figure(2)

numframes =100;

for i=1:numframes
    
    axis([0 2 0 1.8])
    plot(x(i),y(i),'*');
    
    hold on;
    M(:,i)=getframe;
end
 
movie(M,3,10);
xmax=(v0*cos(u0)*(1-exp(-g*k^2.*1.2281)))/(k^2*g)
ymax=-0.4703./(k^2)+(v0*sin(u0)+1/k^2)*(1-exp(-g*k^2.*0.4703))/(g*k^2)
xhmax=(v0*cos(u0)*(1-exp(-g*k^2.*0.4703)))/(k^2*g)



vmax=sqrt(f0_deriv(1.2281)^2+ f_deriv(1.2281)^2)
umax=atan(f_deriv(1.2281)/f0_deriv(1.2281))

figure(3)
t0max=(v0*sin(u0)+sqrt(v0*sin(u0))^2)/g;
t0=linspace(0, t0max, 100);
x0=v0*cos(u0).*t0;
y0=-1/2*g*t0.^2+v0*sin(u0).*t0;
plot(x0,y0)
title('Traiectorie fara rezistenta')

x0max=1/g*v0*cos(u0)*(v0*sin(u0)+sqrt((v0*sin(u0))^2));
figure(4)
numframes =100;

for i=1:numframes
    
    axis([0 9 0 4])
    plot(x0(i),y0(i),'*');
    
    hold on;
    M(:,i)=getframe;
end

