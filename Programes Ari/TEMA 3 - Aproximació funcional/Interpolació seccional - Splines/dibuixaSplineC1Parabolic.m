function [xd,yd,coeficients]=dibuixaSplineC1Parabolic(x,y)
%Si(x) = a_i x^2 + b_i x + c_i
n = length(x);
aprox = (y(2)-y(1))/(x(2) - x(1)); %s0'
derivades = [aprox]; %guardarem les si'
A = zeros(3); 
coefs = []; %te mida 3 coefs(1) = a, coefs(2) = b, coefs(3) = c
b = [];
xd = []; yd = [];
x01 = [0:1/20:1];
h=x(2:end)-x(1:end-1);
coeficients = [];
for i = 1:(n-1)
    A = [x(i)^2 x(i) 1; x(i+1)^2 x(i+1) 1; 2*x(i) 1 0];
    b = [y(i) y(i+1) derivades(i)];
    coefs = A\b';
    derivades = [derivades; 2*coefs(1)*x(i+1)+coefs(2)];
    coeficients = [coeficients; coefs(1) coefs(2) coefs(3)];
    xs = x(i)+x01*h(i); %valors de x a l'interval
    ys = coefs(1)*((xs).^2) + coefs(2)*(xs) + coefs(3);
    xd = [xd xs]; yd = [yd ys];

end
end