function [vect_x, vect_r] = newton_iter2(Ini, Mniter, f, tol)

vect_x = [];
vect_r = ones(1);

h= 1e-5;
x0 = Ini; f0 = f(x0); 
%df0 = df(x0); %declarem lo inicial
df0 = (f(x0+h) - f(x0-h))/(2*h);


for i = 1:Mniter
    if vect_r(end) > tol
        x1 = x0 - (f0/df0);
        f1 = f(x1); 
        %df1 = df(x1);
        df1 = (f(x1+h) - f(x1-h))/(2*h);
        
        vect_x = [vect_x, x0]           %actualitzem el vector de solucions
        vect_r = [vect_r, abs((x1-x0)/x1)];    %actualitzem el vector d'errors

        x0 = x1; f0 = f1; df0 = df1;
    end
end