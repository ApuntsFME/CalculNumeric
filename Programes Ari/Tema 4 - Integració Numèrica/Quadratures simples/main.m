%% 
%Main del Newton-Cotes

error = 1;
errors = [error];
prompt = 'inici interval integració(a): ';
a = input(prompt);
prompt = 'final interval integració(b): ';
b = input(prompt);

I2 = 2*atan(4);

for i = 1:14
    t = abs((I2 - Newton_Cotes(a, b, i))/I2);
    errors = [errors , t];
end

plot(1:length(errors), log10(errors(1:length(errors))), 'o-')
%% 
%Main del Gauss-Legendre

error = 1;
errors = [error];
prompt = 'inici interval integració(a): ';
a = input(prompt);
prompt = 'final interval integració(b): ';
b = input(prompt);

I2 = exp(-a) - exp(-b) + (sqrt(pi)/4)*(erf(b-4) - erf(a-4));

for i = 1:14
    t = abs((I2 - Gauss_Legendre(a, b, i))/I2);
    errors = [errors , t];
end

plot(1:length(errors), log10(errors(1:length(errors))), 'o-')