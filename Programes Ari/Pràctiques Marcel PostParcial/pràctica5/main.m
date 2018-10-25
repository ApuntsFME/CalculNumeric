%% Pràctica 5 - Cas 1
clc; clear all;
a = 0;
b = 5;

Iexacte = exp(-a)-exp(-b)+(sqrt(pi)/4)*(erf(b-4)-erf(a-4));
e = zeros(14,1);
Inew = zeros(1,14);
Igauss = zeros(1,14);

for n = 1:14

%Newton

Inew(n) = Newton(@cas1,a,b,n);

%Gauss

Igauss(n) = Gauss(@cas1,a,b,n);

enew(n) = log10(abs(-Inew(n)+Iexacte));
egauss(n) = log10(abs(-Igauss(n)+Iexacte));

end
hold on
plot(1:n,enew)
plot(1:n,egauss)
legend('Newton', 'Gauss')
hold off

%% Pràctica 5 - Cas2

cas2 = @(x)(1./(1+x.^2));
Iexacte = 2*atan(4);

for n = 1:14

%Newton
Inew(n) = Newton(cas2,a,b,n);

%Gauss
Igauss(n) = Gauss(cas2,a,b,n);

enew(n) = log10(abs(-Inew(n)+Iexacte));
egauss(n) = log10(abs(-Igauss(n)+Iexacte));

end
hold on
plot(1:n,enew)
plot(1:n,egauss)
legend('Newton', 'Gauss')
hold off

%% Pràctica 5 - Cas3

cas3 = @(x)(x./sin(x));
Iexacte = integral(cas3,0,pi/2);

for n = 1:14

%Gauss
Igauss(n) = Gauss(cas2,a,b,n);
egauss(n) = log10(abs(-Igauss(n)+Iexacte));

end

hold on
plot(1:n,egauss)
legend('Gauss')
hold off