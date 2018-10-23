function [x,vect_r] = secante_iter(Ini1, Ini2, niter, f)


vect_r(1) = 0;
vect_r(2) = 0;

% aproximaciones iniciales
x(1) = Ini1;
x(2) = Ini2;

for i = 2:niter-1
    x(i+1) = x(i) - f(x(i)) * (x(i) - x(i-1))/(f(x(i)) - f(x(i-1)));
    r = abs((x(i+1) - x(i))/x(i+1));
    if (r == 0)
        return
    end
    vect_r(i+1) = r;
end

end