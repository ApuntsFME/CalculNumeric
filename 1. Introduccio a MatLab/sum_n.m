function res = sum_n(n)
% Returns: S_n = \sum_{i=1}^n 1/(i^2)

res = 0;
for i = 1:n
    res = res + 1/(i^2);
end