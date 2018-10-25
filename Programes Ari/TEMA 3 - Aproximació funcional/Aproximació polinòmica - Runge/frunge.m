function fr = frunge(v)
m = 2/(0.001);
for i = 1:m+1
    fr(i) = 1/(1+25*v(i).^2);
end