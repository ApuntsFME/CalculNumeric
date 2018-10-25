%mínims quadrats 
function rg2 = runge2(n, m)
X = [-1:2/n:1]; %n particions iguals de l'interval [-1,1] i el 2 és la d(-1,1) 
Y = zeros(1,n+1);
for i = 1:n+1
    Y(i) = 1/(1+25*X(i).^2);
end
p = polyfit(X, Y, m);

axis equal;
r = 0.001;
v = [-1:r:1];
% parche colors
if m == 2
    plot(v, frunge(v), 'b', v, polyval(p, v), 'g')
end
if m == 4
    plot(v, polyval(p, v), 'm')
end
if m == 6
    plot(v, polyval(p, v), 'r')
end
if m == 8
    plot(v, polyval(p, v), 'c')
end
end