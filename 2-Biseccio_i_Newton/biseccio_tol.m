function [vect_x,vect_r] = biseccio_tol(Ini,tol,f)
% 
% [vect_x,vect_r] = biseccio_iter(Ini,niter,f)

err = tol + 1;
vect_x = []; 
vect_r = []; 
x0 = Ini(1); f0 = f(x0); 
a =  Ini(2); fa = f(a); 
if f0*fa > 0 
    error('Interval inicial inadequat')
end
while err > tol
    x1 = (x0 + a)/2; 
    f1 = f(x1); 
    
    vect_x = [vect_x, x0]; 
    vect_r = [vect_r, abs((x1-x0)/x1)];
    err = vect_r(end);
    
    if f1*f0 < 0
        a = x0; fa = f0; 
    end
    
    x0 = x1; f0 = f1; 
end
end