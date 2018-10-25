function [xk] = newton2(x0, tol)
error = tol+1;
n = 0;
errors = [error];
while error > tol
    a = f(x0); %funcio
    b = f2(x0); %derivada
    xk = x0 - a/b;
    error = abs((x0 - xk)/xk);
    errors = [errors, error];
    x0 = xk;
    n = n+1;
    %y(n) = log10(error);
end

plot(1:length(errors), log10(errors(1:length(errors))))
disp('solucio')
disp('iteracions')
n
f(x0)
end