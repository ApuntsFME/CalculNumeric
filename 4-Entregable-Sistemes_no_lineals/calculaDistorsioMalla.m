function distorsioMalla = calculaDistorsioMalla(X,T)
%
% distorsioMalla = calculaDistorsioMalla(X,T)

A = [
    1  -sqrt(3)/3
    0   2*sqrt(3)/3
    ];

distorsioMalla = 0;
for i = 1:size(T, 1)
    Xe = X(T(i,:),:);
    D = [Xe(2,:) - Xe(1,:); Xe(3,:) - Xe(1,:)]'*A;
    ntri = norm(D, 'fro')^2/(2*abs(det(D)));
    distorsioMalla = distorsioMalla + ntri^2;
end
distorsioMalla = sqrt(distorsioMalla);

    
% Completar el codi per calcular la distorsi? de la malla amb nodes X i
% connectivitats T
% ...
% ...
% ...

