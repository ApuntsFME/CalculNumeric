function res = Horner(c, x)

res = c(end);
for i = 1:length(c)-1
    res = x.*res + c(end-i);
end