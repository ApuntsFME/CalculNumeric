function [xk] = biseccio2(x0, a, tol)
if f(x0)*f(a) < 0
    % interval [x0, a];
    error = tol + 1;
    errors = [error];
    while error > tol 
        xk = (x0 + a)/2;
        if f(xk)*f(x0) < 0 
            a = xk;
        else 
            x0 = xk;
        end
        error = abs((x0 - xk)/xk);
        errors = [errors, error];
    end
else
    
    disp('interval mal donat')
    
end

disp('solucio')
xk
f(xk)
end