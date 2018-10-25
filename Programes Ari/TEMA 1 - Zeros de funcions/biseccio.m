function [xk] = biseccio(niter, x0, a)
if f(x0)*f(a) < 0
    for i = 1:niter 
        xk = (x0 + a)/2;
        if f(xk)*f(x0) < 0 
            a = xk;
        else 
            x0 = xk;
        end
        f(xk)
    end
    
else
    
    error('interval mal donat')
    
end

disp('solucio')
xk
f(xk)
end
