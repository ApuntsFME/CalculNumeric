%interpolació (si dónes les dades exactes n=m)
function rg = runge(n)
X = [-1:2/n:1]; %n particions iguals de l'interval [-1,1] i el 2 és la d(-1,1) 
Y = zeros(1,n+1);
for i = 1:n+1
    Y(i) = 1/(1+25*X(i).^2);
end
p = polyfit(X, Y, n);

axis equal;
r = 0.001;
v = [-1:r:1];
% parche pels colors
if n == 2 
    plot(v, frunge(v), 'b', v, polyval(p, v), 'g')
end
if n == 4
    plot(v, polyval(p, v), 'r')
end
if n == 6
    plot(v, polyval(p, v), 'c')
end
if n == 8
    plot(v, polyval(p, v), 'm')
end
end