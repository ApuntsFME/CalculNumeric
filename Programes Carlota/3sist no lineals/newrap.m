function [matSol, vectRk] = newrap(ini, maxiter, tol)

x0 = ini;

matSol = zeros(length(x0), 0);
vectRk = zeros(1, length(x0));

ri = 1; i = 0;

while ri > tol && i <= maxiter
    f0 = residu(x0);
    j0 = jacobi(x0);
    x1 = x0 - j0\f0;
    ri = norm(x0-x1)/norm(x1);
    matSol = [matSol,x0];
    vectRk(i+1) = ri;
    
    x0 = x1;
    i = i+1;
end

if i > maxiter
    fprintf('NO CONVERGEIX');
end
