tspan=linspace(0, 2*pi, 100)
Y0=[1, 0]
[t, Z]=ode45('alb', tspan, Y0)
plot(t, Z(:,1), t,Z(:,2))