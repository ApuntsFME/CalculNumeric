function [matSol, vectRk, res] = newrap(ini, maxiter, tol, F)

x0 = ini;

matSol = zeros(length(x0), 0);
vectRk = zeros(1, length(x0));

ri = 1; i = 0;

while ri > tol && i <= maxiter
    
    f0 = numericalDerivative(F,x0);
    j0 = numericalHessian(F,x0);
    x1 = x0 - j0\f0;
    ri = norm(x0-x1)/norm(x1);
    matSol = [matSol,x0];
    vectRk(i+1) = ri;
    
    x0 = x1;
    i = i+1;
end

res = x0;

if i > maxiter
    fprintf('NO CONVERGEIX');
end
