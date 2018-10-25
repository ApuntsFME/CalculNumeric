function val = Newton(f,a,b,ordre)
x = linspace(a,b,ordre);
w = calculapesos(x,a,b);
val = f(x)*w;
end