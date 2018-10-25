function Iaprox=compostaSimpson(f,a,b,m)

x = linspace(a,b,(2*m)+1); h=(b-a)/(2*m);
fxext = feval(f,x(2:2:end-2)); %funcio als extrems d'intervals
fxint = feval(f,x(1:2:end-1)); %funcio als interiors
Iaprox = (h/3)*(feval(f,a) + 2*sum(fxext) + 4*sum(fxint) + feval(f,b));

end
