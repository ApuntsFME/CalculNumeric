function [vect_x,vect_r] = newton_tol(Ini, tol, f, df)

vect_x = [];
vect_r = [];
x = Ini;
fx = f(x);

while fx > tol
    vect_x = [vect_x, x - fx/df(x)];
    vect_r = [vect_r, abs((x - vect_x(end))/x)];
    x = vect_x(end);
    fx = f(x);
end

end