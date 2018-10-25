%No funciona

function val = NewtonOberta(f,a,b,ordre)
x1 = linspace(a,b,ordre+2);
x = x1(2:ordre+1);
w = calculapesos(x,a,b);
val = f(x)*w;
end