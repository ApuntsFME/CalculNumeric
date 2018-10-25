function [res] = whittaker_er()
format long;
prompt = 'aprox inicial: ';
x_0 = input(prompt);
prompt = 'tolerància: ';
tol = input(prompt);
prompt = 'm: ';
m = input(prompt);

n = 0;
x = x_0;
X = [x_0];
error = tol+1;
errors = [error];

while(error > tol) 
    xk = x - (f(x)/m);
    error = abs((x-xk)/ xk);
    errors = [errors, error];
    X = [X, xk];
    x = xk;
end

f(x);
res = x;
end