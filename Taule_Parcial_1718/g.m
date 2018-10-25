function [y]= g(x,a,b)
N=length(a);
y=zeros(size(x)); 
for n=1:N
    y = y + a(n)*cos(n*x+b(n));
end

