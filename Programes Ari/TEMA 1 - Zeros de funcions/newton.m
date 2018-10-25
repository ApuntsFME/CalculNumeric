function [xk] = newton(niter, x0)
for i = 1:niter
    a = f(x0);
    b = f2(x0);
    xk = x0 - (a/b);
    x0 = xk;
end
disp('solucio')

f(x0)
end