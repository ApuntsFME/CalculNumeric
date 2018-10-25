function res = residu(vect_x)

res = zeros(3,1);

res(1) = 6*vect_x(1) - 2*cos(vect_x(2)*vect_x(3)) - 1;
res(2) = 9*vect_x(2) + sqrt(vect_x(1)*vect_x(1) + sin(vect_x(3)) + 1.06) + 0.9;
res(3) = 60*vect_x(3) + 3*exp(vect_x(1)*vect_x(2)) + 10*pi - 3;

%no esta be del tot definir el vector amb mida 3, pq potser en un altre
%moment hi passem un vector de mida n != 3 :((
