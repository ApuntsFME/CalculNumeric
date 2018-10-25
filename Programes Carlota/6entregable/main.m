clear; close all; clc

load malla.mat
figure(1);
plotMesh(X,T) 

%posem en un vector els nodes interiors
%fem el reshape per poder aplicarhi la funcio q calcula la distorsio

F = @(y)(calculaDistorsioMalla([reshape(y,Nint,2);X(Nint+1:end,:)],T));

y0 =  reshape(X(1:Nint,:),2*Nint,1);

tol = 1e-8; maxIter = 50; 

%HEM DE PROGRAMAR NEWTON
% Completar el codi per determinar la posicio dels nodes interiors que
% minimitza la distorsio de la malla. 

[matSol, vectRk, x0] = newrap(y0, maxIter, tol, F);

X1 = reshape(x0(1:2*Nint,:), Nint, 2);

X1 = [X1; X(Nint+1:end,:)];

a  = calculaDistorsioMalla(X1,T)
X1(1,:)
figure(2);
plotMesh(X1,T)

it = linspace(0,length(vectRk)-1,length(vectRk));

figure(3);
plot(it, log10(vectRk),'o-')
grid on
xlabel('iteracions k')
ylabel('log_{10} r^k')
