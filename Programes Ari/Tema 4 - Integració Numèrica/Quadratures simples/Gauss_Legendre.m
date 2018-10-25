function [Igauss] = Gauss_Legendre(a, b, n)
nIP = n;
[z,w] = QuadraturaGauss(nIP);
x = (a+b)/2 + (b-a)*z/2;
Igauss = 0;
for i = 1:length(x)
    Igauss = Igauss + (b-a)*0.5*w(i)*f(x(i));
end
end

