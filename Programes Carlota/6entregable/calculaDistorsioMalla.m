function dism = calculaDistorsioMalla(X,T)
%
% distorsioMalla = calculaDistorsioMalla(X,T)

A = [
    1  -sqrt(3)/3
    0   2*sqrt(3)/3
    ];

[m,m2] = size(T);


q = zeros(1,m);

for i = 1:m
    Xi = X(T(i,:),:);
    Di = [Xi(2,:)-Xi(1,:); Xi(3,:)-Xi(1,:)]'*A;
    q(i) = (norm(Di, 'fro')^2/(2*abs(det(Di))))^2;
end

dism = sqrt(sum(q));

