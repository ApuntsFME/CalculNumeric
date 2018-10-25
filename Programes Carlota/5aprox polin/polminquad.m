function [coeff,norm2_res]=polminquad(x,y,m)
%Verifiquem n>=m
if size(x)-1 < m
    disp('Error: n < m')
    return
end


%Calculem A i en fem la descomposicio QR
%A te per columnes 1, x, x^2, etc (fins grau del polinomi = m)
a1 = ones(size(x));
A = [a1];
for i = 1:m
    ai = (x.^i);
    A = [A ai];
end

[Q, R] = qr(A);


%Comprovem i mostrem que Q és ortogonal
disp('La norma inf de Id - Qt*Q es')
a = norm(eye(m+1)-Q'*Q, inf);
disp(a);

disp('La norma 2 de Id - Qt*Q es')
a2 = norm(eye(m+1)-Q'*Q, 2);
disp(a2);

%Resolem R*a = Q'*y
coeff = Q'*y;
for i = m+1:-1:1
    for j = i+1:m+1
        coeff(i) = coeff(i) - R(i, j)*coeff(j);
    end
    coeff(i) = coeff(i)/R(i, i);
end

%Calculem el residu i dibuixem
norm2_res = norm((A*coeff)-y',2);
disp('La norma 2 de A*a-y es')
disp(norm2_res);


coeff = coeff';

xPintar = min(x):0.001:max(x);

aprox = polyval(fliplr(coeff),xPintar);
plot(x, y, '.') 
hold on
plot(xPintar, aprox, 'r')
hold off

end