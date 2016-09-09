date; 
[t,q]=ode45(@sistem_f,[0;10],[0;v0/R]); 
teta=q(:,1); 
N=3*m*g*cos(teta)-2*m*g+m*v0^2/R; 
x1=R*cos(teta); 
x2=R*sin(teta); 
figure(1) 
plot(x1,x2,'.','Markersize',6) 
title('Pendulul matematic') 
xlabel('x1') 
ylabel('x2') 
grid on 
figure(2) 
title('Pendulul matematic') 
xlabel('x1') 
ylabel('x2') 
grid on 
for i=1:size(teta,1) 


plot(x1(i),x2(i),'*',-R,-R,'o',R,R,'o'); 
axis equal 
hold on 
M(i)=getframe; 


end 

movie(M,3,10) 

figure(3) 
plot(t,N) 
title('Reactiunea N') 
xlabel('t') 
ylabel('N') 
grid on 
figure(4) 
plot(t,teta) 
title('Unghiul teta ca functie de t') 
xlabel('t') 
ylabel('teta') 
grid on