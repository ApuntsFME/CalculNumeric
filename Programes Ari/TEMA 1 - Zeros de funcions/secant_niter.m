function [res] = secant_niter()
format long;
prompt = 'aprox inicial x0: ';
x_0 = input(prompt);
prompt = 'aprox inicial x1: ';
x_1 = input(prompt);
prompt = 'nº iteracions: ';
niter = input(prompt);

n = 0;
x0 = x_0;
x1 = x_1;
X = [x_0, x_1];
while(n < niter) 
    xk = x1 - (f(x1)*(x1-x0))/(f(x1)-f(x0));
    X = [X, xk];
    x0 = x1;
    x1 = xk;
    n = n+1;
end

f(xk)
res = xk
end