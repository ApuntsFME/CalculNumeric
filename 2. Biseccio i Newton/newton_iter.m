function [vect_x,vect_r] = newton_iter(Ini, niter, f, df)

vect_x = zeros(1,niter); 
vect_r = zeros(1,niter); 
x = Ini;

for i = 1:niter
    vect_x(i) = x - f(x)/df(x);
    vect_r(i) = abs((x - vect_x(i))/x);
    x = vect_x(i);
end

end