clear;
close all;
clc

n = input('mida vector: ');
%vect_x = rand(n,1)
vect_x = ones(n,1);

%RESIDU
res = residu(vect_x);

%JACOBIANA

matJ = jacobi(vect_x);


%% NEWTON-RHAPSON

ini = ones(n,1);

maxiter = 15;

[matSol, vectRk] = newrap(ini, maxiter, 1e-10);

s = length(vectRk);

x = linspace(0,s,s);

figure(1);
plot(x, log10(vectRk),'o-')
grid on
xlabel('iteracions k')
ylabel('log_{10} r^k')
hold on

%% BROYDEN

ini = ones(3,1);

maxiter = 15;

[Sol2, vect2] = broyden(ini, maxiter, 1e-10);

s2 = length(vect2);

x2 = linspace(0,s2,s2);

figure(1);
plot(x2, log10(vect2),'p-')
grid on
xlabel('iteracions k')
ylabel('log_1_0 r^k')
lg = legend('newton-raphson', 'broyden');
