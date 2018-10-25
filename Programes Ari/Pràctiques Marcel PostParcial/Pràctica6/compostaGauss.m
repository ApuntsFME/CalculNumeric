function Iaprox=compostaGauss(f,a,b,m,ordre)

x = linspace(a,b,m+1);
I = zeros(1,m);
for i = 1:m
    I(i) = Gauss(f,x(i),x(i+1),ordre);
end
Iaprox = sum(I);
end