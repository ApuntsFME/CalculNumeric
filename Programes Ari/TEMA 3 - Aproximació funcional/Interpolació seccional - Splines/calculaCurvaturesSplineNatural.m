function d2S = calculaCurvaturesSplineNatural(x,y)
n = length(x);
mu = []; lambda = []; d = [];

h=x(2:n)-x(1:n-1);
t=y(2:n)-y(1:n-1);

for i = 2:n-1
    mu(i-1) = h(i-1)/(h(i) + h(i-1));
    lambda(i-1) = h(i)/(h(i) + h(i-1));
    d(i-1) = 6/(h(i) + h(i-1))*(t(i)/h(i) - t(i-1)/h(i-1));
end

A = 2*eye(n-2, n-2);
for i = 2:n-2
    A(i, i-1) = mu(i);
end
for i = 1:n-3
    A(i, i+1) = lambda(i);
end

d2S = A\d';
d2S = d2S';
d2S = [0, d2S, 0]; %són s0 i sn que en l'spline natural són 0
end
