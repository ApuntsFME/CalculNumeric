function [res] = secant()
format long;
prompt = 'aprox inicial x_0: ';
x_0 = input(prompt);
prompt = 'aprox inicial x_1: ';
x_1 = input(prompt);
prompt = 'tolerància: ';
tol = input(prompt);

x0 = x_0;
x1 = x_1;

X = [x_0, x_1];
error = tol+1;
errors = [error];

while(error > tol) 
    xk = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
    error = abs((x1-xk)/ xk);
    errors = [errors, error];
    X = [X, xk];
    x0 = x1;
    x1 = xk;
end

disp('f')
f(xk)
res = xk;
end