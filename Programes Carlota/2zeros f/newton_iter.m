function [vect_x, vect_r] = newton_iter(Ini, niter, f, df)

vect_x = zeros(1,niter); 
vect_r = zeros(1,niter); 

x0 = Ini; f0 = f(x0); df0 = df(x0); %declarem lo inicial

for i = 1:niter
    x1 = x0 - (f0/df0);
    f1 = f(x1); df1 = df(x1);
    
    vect_x(i) = x0;                 %actualitzem el vector de solucions
    vect_r(i) = abs((x1-x0)/x1);    %actualitzem el vector d'errors
    
    x0 = x1; f0 = f1; df0 = df1;
end