function nr = newtonraphson(x0, niter, r, J)
y = zeros(1,niter);

for i = 1:niter
    aprox = J(x0)\(-r(x0));
    xk = x0 + aprox';
    error = abs((x0 - xk)/xk);
    y(i) = log10(error);
    x0 = xk;
    i = i+1;
end
nr = x0;
plot(1:niter, y(1:niter), 'o-')
hold on
end