function d2S = calculaCurvaturesSplineNatural(x, y)
%
%
h=(x(2:end))-x(1:end-1);
t=y(2:end)-y(1:end-1);
l=h(2:end)./(h(2:end)+h(1:end-1));
m=h(1:end-1)./(h(2:end)+h(1:end-1));
d=(6./(h(2:end)+h(1:end-1))).*((t(2:end)./h(2:end))-(t(1:end-1)./h(1:end-1)));

n=length(l)+1;
M=[m(1), 2, l(1), zeros(1, n-2)];
for i=2:n-2
    M = [M; zeros(1, i-1), m(i), 2, l(i), zeros(1, n-i-1)];
end
M = [M; zeros(1, n-2), m(i), 2, l(i)];
d2S = M\(d');
end
