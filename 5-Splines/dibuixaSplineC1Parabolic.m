function [x3, y3, coef] = dibuixaSplineC1Parabolic(x,y,s)

% Initialize
coef = [];
x3 = [];
y3 = [];

x01 = [0:1/20:1];

for i=1:length(x)-1
    A = [x(i)^2, x(i), 1; x(i+1)^2, x(i+1), 1; 2*x(i), 1, 0];
    coefi = (A \ [y(i); y(i+1); s])';
    
    s = 2*coefi(1)*x(i+1) + coefi(2);
    coef = [coef; coefi];

    xs = x(i) + x01*(x(i+1) - x(i));
    x3 = [x3, xs];
    y3 = [y3, polyval(coefi, xs)];
end
end
