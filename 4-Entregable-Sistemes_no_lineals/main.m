clear; close all; clc

load malla.mat
%plotMesh(X,T)
calculaDistorsioMalla(X, T)

F = @(y)(calculaDistorsioMalla([reshape(y,Nint,2);X(Nint+1:end,:)],T));

y0 =  reshape(X(1:Nint,:),2*Nint,1);

tol = 1e-11; maxIter = 50; 

i = 0;
x = y0;
res = [];
resa = 1;
while (i<maxIter && resa >= tol)
    x1 = x - (numericalHessian(F,x)\numericalDerivative(F,x));
    resa = norm(x-x1)/norm(x1);
    res = [res; resa];
    x = x1;
    i = i+1
end
[reshape(x,Nint,2);X(Nint+1:end,:)]
F(x)
plot(log(res))
% plotMesh([reshape(x,Nint,2);X(Nint+1:end,:)],T)

% Completar el codi per determinar la posicio dels nodes interiors que
% minimitza la distorsio de la malla. 
% Abans de fer servir el metode de Newton, cal completar la funcio
% calculaDistorsioMalla
% ...
% ...
% ...
