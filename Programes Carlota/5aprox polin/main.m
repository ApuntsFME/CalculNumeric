clear; close all; clc

%calculem polinomis interpoladors
xplot = linspace(-1, 1, 1000);

x1 = linspace(-1,1,3);
x2 = linspace(-1,1,5);
x3 = linspace(-1,1,7);
x4 = linspace(-1,1,9);

y1 = 1./(1+25.*(x1.^2));
p1 = polyfit(x1,y1,2); %amb aixo trobo coefs polin. grau 2
pfun1 = polyval(p1,xplot);
figure(1)
plot(xplot,pfun1)
hold on

y2 = 1./(1+25.*(x2.^2));
p2 = polyfit(x2,y2,4);
pfun2 = polyval(p2,xplot);
figure(1)
plot(xplot,pfun2)
hold on

y3 = 1./(1+25.*(x3.^2));
p3 = polyfit(x3,y3,6);
pfun3 = polyval(p3,xplot);
figure(1)
plot(xplot,pfun3)
hold on

y4 = 1./(1+25.*(x4.^2));
p4 = polyfit(x4,y4,8);
pfun4 = polyval(p4,xplot);
figure(1)
plot(xplot,pfun4)
hold on

yplot = 1./(1+25.*(xplot.^2));
figure(1)
plot(xplot,yplot)

legend('n = 3', 'n = 5', 'n = 7', 'n = 9', 'f');