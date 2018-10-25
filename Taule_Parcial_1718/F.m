function r = F(x) 
load('dades.mat');

t1 = x(1); t2 = x(2); fi = x(3);
r = zeros(3,1);
r(1) = norm([t1+cos(fi)*p(1,1)-sin(fi)*p(2,1)-q(1,1);t2+sin(fi)*p(1,1)+cos(fi)*p(2,1)-q(2,1)]);
r(2) = norm([t1+cos(fi)*p(1,2)-sin(fi)*p(2,2)-q(1,2);t2+sin(fi)*p(1,2)+cos(fi)*p(2,2)-q(2,2)]);
r(3) = norm([t1+cos(fi)*p(1,3)-sin(fi)*p(2,3)-q(1,3);t2+sin(fi)*p(1,3)+cos(fi)*p(2,3)-q(2,3)]);
end

