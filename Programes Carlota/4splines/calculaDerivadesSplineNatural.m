function d2S = calculaDerivadesSplineNatural(x,y)

h=x(2:end)-x(1:end-1);
t=y(2:end)-y(1:end-1);

landa = h(2:end)./(h(2:end)+h(1:end-1));
mu = h(1:end-1)./(h(2:end)+h(1:end-1));
e = (3./(h(2:end)+h(1:end-1))).*(h(2:end)./h(1:end-1).*t(1:end-1)+h(1:end-1)./h(2:end).*t(2:end));

n = length(x)-1;

A = zeros(n-1,n+1);

for i = 1:n-1
    A(i,i) = landa(i);
    A(i,i+1) = 2;
    A(i,i+2) = mu(i);
end

eq1= [2*h(1) h(1) zeros(1,size(A,2)-2)];
eq2 = [zeros(1,size(A,2)-2) h(end) 2*h(end)];

A = [eq1
     A
     eq2];
 
e = [3*t(1) e 3*t(end)];


d2S = A\e';
