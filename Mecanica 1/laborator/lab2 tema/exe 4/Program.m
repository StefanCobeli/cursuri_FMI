x=linspace(-5,5,100);
for i=1:100
    y(i)=f1(x(i))
end;
x1=linspace(-5,5,100);
for i=1:100
    y1(i)=f2(x(i))
end;
hold on
plot(x,y,'r','LineWidth',2);
grid on
plot(x1,y1,'b','LineWidth',2);
hold off;
legend('graficul lui f1','graficul lui f2');
title('graficele functiilor f1 si f2')