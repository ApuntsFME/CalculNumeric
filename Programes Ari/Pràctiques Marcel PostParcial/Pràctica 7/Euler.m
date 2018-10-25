function [x,Y] = Euler(f,a,b,y0,n)

x = linspace(a,b,n+1);
h = (b-a)/n;
m = length(y0);
Y = zeros(m,n+1);
Y(:,1) = y0;

for i = 1:n
    Y(:,i+1) = Y(:,i) + h*f(x(i),Y(:,i)); 
end

end

% Runge-Kutta
%{

Ordre p = s per s<5, per s>=5, ordre és p-1 o p-2.

Butcher (s=5)

c1|0   0   0   0   0   b1 +...+ b5 = 1
c2|a21 0   0   0   0   ar1+...+ ar5= cr
.  .   .   0   0   0
. |.   .   .   0   0
c5|a51 a52 a53 a54 0
--|-----------------
  |b1  b2  b3  b4  b5

Y(i+1) = Y(i) + h(b1k1 + b2k2 + b3k3 + b4k4 + b5k5)

k1 = f(x(i) + c1*h, Y(i))
k2 = f(x(i) + c2*h, Y(i) + h(a21*k1))
...
k5 = f(x(i) + c5*h, Y(i) + h(a51*k1 + a52*k2 +...+ a54*k4)

%}

%{
Diferències centrades:
Y0 = alfa;
Y(1) = Y(0) + h*f(x0,y0);
Y(i+1) = Y(i-1)+2h*f(xi,Yi);

Convergència: Buscar Y(i+1) = G*Y(i)

Estudiar h tq abs(G)<1

Canvi d'ordre a sistema:
y = y1; y' = y2; y''=y3;... y(n-1 der) = yn;

dyn
--- = f(x,y1,y2,...,y(n-1))
dx
%}