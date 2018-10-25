clear; close all; clc;
    
%EXERCICI 1
f = @(x)(1./(1+25*x.^2));

figure(1);
v = [3,5,7,9];
for i=1:4
    n = v(i);
    x = linspace(-1,1,n);
    y = zeros(1,n);
    
    y = f(x);
   

    p = polyfit(x',y',n-1);
    pfun = @(x)polyval(p,x);
    figure(1);
    xx = linspace(-1,1);
    plot(xx,pfun(xx));
    hold on;
    grid on;
end
figure(1);
plot(xx,f(xx),'--');
legend('n = 3','n = 5', 'n = 7', 'n = 9', 'f')

% EXERCICI 2

figure(2);
n = 101;
v = [2,4,6,8]
for i=1:4
    m = v(i);
    x = linspace(-1,1,n);
    y = zeros(1,n);
    
    y = f(x);
   

    p = polyfit(x',y',m);
    pfun = @(x)polyval(p,x);
    
    xx = linspace(-1,1);
    plot(xx,pfun(xx));
    hold on;
    grid on;
end

plot(xx,f(xx),'--');
legend('m = 2','m = 4', 'm = 6', 'm = 8', 'f')