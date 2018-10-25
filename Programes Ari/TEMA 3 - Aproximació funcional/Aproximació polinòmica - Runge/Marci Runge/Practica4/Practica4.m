%% Pràctica 2 - Ap 1 (n = m, punts = grau)

clear all
clc

n = input('Introdueix valor n:');
%n punts equiespaiats

X = [-1: 2/(n-1): 1];
Y = f(X);

P = polyfit(X,Y,n-1);

X1 = [-1:0.001:1];
Y1 = polyval(P,X1);
X2 = [-1:0.001:1];
Y2 = f(X2);
plot(X1,Y1,X2,Y2)

%% Pràctica 2 - Ap 2.1 (mínims quadrats- grau m, n+1 fixos (101))

clear all
clc

m = input('Introdueix valor m:');

X = [-1:2/100:1];
Y = f(X);

P = polyfit(X,Y,m);

X1 = [-1:0.001:1];
Y1 = polyval(P,X1);
X2 = [-1:0.001:1];
Y2 = f(X2);
figure(2)
plot(X1,Y1,X2,Y2)

%% Pràctica 2 - Ap 2.2 - avaluar el residu (E)

res = zeros(1,4);
i = 1;
for m = [2 4 6 8]
%minimitzarem E per cada un d'aquests valors
    X = [-1:2/100:1];
    Y = f(X);
    P = polyfit(X,Y,m);
    
    dif = polyval(P,X) - Y;
    
    res(i) = sqrt(dif*dif');
    i = i+1;
end

%el residu disminueix en funció de m
%en norma 2 sempre es comportarà així perquè minimitzes distància, però
%per exemple amb la norma del màxim E pot tenir a infinit (F. Runge)

%% Pràctica 2 - Ap 3.1 mínims quadrats amb producte escalar continu
% En particular, Legendre

clear all
clc

m = input('Introdueix valor m:');

X = [-1:2/100:1];
Y = f(X);
n = length(X);

V = zeros(1,m+1);

for i = 1:m+1
    V(i) = 2/(2*(i-1)+1); %producte de dos polinomis de legendre quan n = m
    % int de -1 a 1 de Pm*Pn = 2/(2n+1)
end

V = diag(V); %el posem a una matriu diagonal 

b = zeros(m+1,1);

for i = 1:(m+1)
    syms x %si escrivim P ens surt el polinomi en funció de x
    b(i) = int(f(x)*legendreP(i-1,x),-1,1);
end

c = V\b;

syms P(x)
P = c(1)*legendreP(0,x);

for i = 2:m+1
    P = P + c(i)*legendreP(i-1,x);
end

X1 = [-1:0.01:1];
j = length(X1);
for i = 1:j
    x = X1(i);
    Y1(i) = subs(P); %polinomi avaluat en x
end
X2 = [-1:0.01:1];
Y2 = f(X2);
figure(2)
plot(X1,Y1,X2,Y2)

%% Pràctica 2 - Ap 3.2 - mínims quadrats prod escalar continu
% Txebi Tn = cos(narccos(x))
clear all
clc

m = input('Introdueix valor m:');

X = [-1:2/100:1];
Y = f(X);
n = length(X);

V = zeros(1,m);
V(1) = pi;
V(2:m) = pi/2;

V = diag(V);

b = zeros(m,1);

for i = 1:m
    syms x
    b(i) = int((1/sqrt(1-x^2))*f(x)*chebyshevT(i-1,x),x,-1,1);
end

c = V\b;

syms P(x)
P = c(1)*chebyshevT(0,x);

for i = 2:m
    P = P + c(i)*chebyshevT(i-1,x);
end

X1 = [-1:0.01:1];
j = length(X1);
for i = 1:j
    x = X1(i);
    Y1(i) = subs(P);
end
X2 = [-1:0.01:1];
Y2 = f(X2);
figure(3)
plot(X1,Y1,X2,Y2)