function [res iter] = sum_tol(tol)
% Returns: S_n = \sum_{i=1}^n 1/(i^2)
%    on n es la mes petita tal que l'error es menor a la tolerancia

max_iter = 10^(8);

res = 0;
iter = 0;
err = tol + 1;
while iter < max_iter && err > tol
    iter = iter + 1;
    res = res + 1/(iter^2);
    err = abs((pi^2)/6 - res);
end

if iter == max_iter
    error('Nombre màxim d''iteracions excedit.');
end