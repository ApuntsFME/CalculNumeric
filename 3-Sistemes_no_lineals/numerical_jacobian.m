function J = numerical_jacobian(f, x)

h = 1e-8;
J = zeros(length(x), length(x));

for i = 1:length(x)
    e = zeros(length(x), 1);
    e(i) = h;
    J(:, i) = (f(x + e) - f(x))./h;
end

end

