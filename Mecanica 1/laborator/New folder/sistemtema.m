tspan=linspace(0, 1, 11);
Y0=[5, 3];
[t, Z]=ode45('fint', tspan, Y0);
U=zeros(10,2);
for i=1:11
    U(i,1)=3.*t(i) +Z(i,1);
    U(i,2)=Z(i,2);
end
plot(U(:,1),U(:,2));