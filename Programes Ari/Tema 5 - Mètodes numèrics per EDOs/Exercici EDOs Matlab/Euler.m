function [x,Y]=Euler(f,v,y0,npassos) 
%no podem posar [a,b], posem v
a = v(1);
b = v(2);
alpha = y0; 
h = (b-a)/npassos;
x = [a:h:b];
Y = x;
Y(1) = alpha;
for i = 1:npassos
    Y(i+1) = Y(i) + h*f(x(i), Y(i));  
end
end