function matJ = jacobi(vect_x)

matJ = zeros(3,3);

matJ(1,1) = 6;
matJ(1,2) = 2*vect_x(3)*sin(vect_x(2)*vect_x(3));
matJ(1,3) = 2*vect_x(2)*sin(vect_x(2)*vect_x(3));
matJ(2,1) = vect_x(1)/sqrt(vect_x(1)*vect_x(1) + sin(vect_x(3)) + 1.06);
matJ(2,2) = 9;
matJ(2,3) = cos(vect_x(3))/(2*sqrt(vect_x(1)*vect_x(1) + sin(vect_x(3)) + 1.06));
matJ(3,1) = 3*exp(vect_x(1)*vect_x(2))*vect_x(2);
matJ(3,2) = 3*exp(vect_x(1)*vect_x(2))*vect_x(1);
matJ(3,3) = 60;