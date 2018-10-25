
function [matSol, vectRk] = broyden(ini, maxiter, tol)

x0 = ini;

matSol = zeros(length(x0), 0);
vectRk = zeros(1, length(x0));

s0 = jacobi(x0);
ri = 1; i = 0;
f0 = residu(x0);

while ri > tol && i <= maxiter
    
    inc = - s0\f0;
    x1 = x0 + inc;
    f1 = residu(x1);
    
    ri = norm(x0-x1)/norm(x1);
    matSol = [matSol,x0];
    vectRk(i+1) = ri;
    
    tr = inc/(norm(inc))^2;
    tr = tr';
    s0 = s0 + f1*tr;
    f0 = f1;
    x0 = x1;
    i = i+1;
end

if i > maxiter
    fprintf('NO CONVERGEIX');
end

% utilitzem broyden quan calcular al jacobiana es molt costos/impossible.
% en els metodes quasi newton substituim Jk per una aproximacio secant Sk.
% calculem x^(k+1) = x^k - (Sk)^-1 f^k, Sk verifica Sk*inc(x^k) = inc(f^k).
% en broyden la cond addicional es (Sk - S(k-1))u = 0, u ort a inc(x^k).
% escrivim Sk = S(k-1) + u*norm^2(inc(x^k)) (...) u = f^k/norm^2(inc(x^k)).
% aixi actualitzem Sk

