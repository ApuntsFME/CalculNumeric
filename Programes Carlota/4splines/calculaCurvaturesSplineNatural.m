function d2S = calculaCurvaturesSplineNatural(x,y)

h=x(2:end)-x(1:end-1);
t=y(2:end)-y(1:end-1);

landa = h(2:end)./(h(2:end)+h(1:end-1));
mu = h(1:end-1)./(h(2:end)+h(1:end-1));
e = (6./(h(2:end)+h(1:end-1))).*((t(2:end)./h(2:end))-(t(1:end-1)./h(1:end-1)));

n = length(x)-1;

A = zeros(n-1,n+1);

for i = 1:n-1
    A(i,i+2) = landa(i);
    A(i,i+1) = 2;
    A(i,i) = mu(i);
end

eq1 = [1 zeros(1, size(A,2)-1)];
eq2 = [zeros(1, size(A,2)-1) 1];

A = [eq1
     A
     eq2];
 
e = [0 e 0];

d2S = A\e';
