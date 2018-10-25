function [f] = phi(x)
    t = x(1:2);
    theta = x(3);
    load dades_examen.mat
    A = [cos(theta), -sin(theta)
        sin(theta), cos(theta)];
    f = 0;
    for i = 1:26
        f = f + norm(t + A*p(:,i) - q(:,i))^2;
    end
end