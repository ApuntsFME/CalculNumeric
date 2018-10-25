function Iaprox=compostaSimpson(f,a,b,m)

x = linspace(a,b,2*m+1); h=(b-a)/(2*m);
% fxint = feval(f,x(2:end-1)); %funcio als punts interiors
% Iaprox = feval(f,a)*h/2 + sum(fxint)*h + feval(f,b)*h/2;
sum = 0;
for i = 1:m
   sum = sum + feval(f, x(2*i-1)) +  4*feval(f, x(2*i)) + feval(f, x(2*i+1));
end
Iaprox = h/3*sum;
