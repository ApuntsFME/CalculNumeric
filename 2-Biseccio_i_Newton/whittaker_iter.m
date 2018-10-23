function [x,vect_r] = whittaker_iter(Ini1, m, niter, f)

% aproximacion inicial
x(1) = Ini1;
vevect_r(1) = 0;

for i = 1:niter-1
    x(i+1) = x(i) - f(x(i))/m;
    vect_r(i+1) = abs((x(i+1) - x(i))/x(i+1));
end

end
