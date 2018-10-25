function [x3, y3, coef] = dibuixaSplineC1Parabolic(x,y,dSini)

x3 = []; y3 = []; coef = [];
x01 = [0:1/20:1]; %20 subintervals a cada interval
h=x(2:end)-x(1:end-1);

ds = [dSini];

for i = 1:length(x)-1
    A = [x(i)^2 x(i) 1; x(i+1)^2 x(i+1) 1; 2*x(i) 1 0];
    f = [y(i); y(i+1); ds(i)];
    coefi = A\f;
    coef = [coef; coefi];
    
    xs = x(i)+x01*h(i); %valors de x a l'interval
    ys = polyval(coefi, xs);
    x3 = [x3 xs];
    y3 = [y3 ys];
    ds = [ds 2*coefi(1)*x(i+1)+coefi(2)];
    
end