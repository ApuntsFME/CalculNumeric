function [y]=dg(x,a,b)
N=length(a);
y=zeros(size(x));
for n=1:N
    y = y - a(n)*sin(n*x+b(n))*n;
end
