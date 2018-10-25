function [f] = phia(x)
    load dades.mat
    t = x(1:2);
    theta = x(3);
    A = [cos(theta), -sin(theta)
        sin(theta), cos(theta)];
    f = [norm(t + A*X(:,1) - Y(:,1));norm(t + A*X(:,2) - Y(:,2));norm(t + A*X(:,3) - Y(:,3))];
end