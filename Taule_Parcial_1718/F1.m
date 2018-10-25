function f = F1(x)

load('dades.mat');

f = 0;
for i = 1:length(s)
    an = x(3); % an = angle
    A = [cos(an) -sin(an); sin(an) cos(an)];
    aux = [x(1); x(2)] + A*p(:,i) - s(:,i);
    f = f + (aux(1))^2 + (aux(2))^2;
end

end

