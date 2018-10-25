function [I] = Newton_Cotes(a, b, n)

% prompt = 'inici interval integració(a): ';
% a = input(prompt);
% prompt = 'final interval integració(b): ';
% b = input(prompt);
% prompt = 'n: ';
% n = input(prompt);

x = [a:(b-a)/n:b];

%Calculem els pesos resolent el següent sistema:
c = zeros(n+1, 1);
for i = 1:n+1
    c(i) = (b.^i - a.^i)/i;
end
M = zeros(n+1, n+1);
for i = 1:n+1
    for j = 1:n+1
        M(i, j) = x(j).^(i-1);
    end
end

w = M\c;

%Aproximem el valor de la integral amb el sumatori
I = 0;
for i = 1:n+1
    I = I + w(i)*f(x(i));
end

% %Valor real de la integral
% I2 = exp(-a) - exp(-b) + (sqrt(pi)/4)*(erf(b-4) - erf(a-4))

end