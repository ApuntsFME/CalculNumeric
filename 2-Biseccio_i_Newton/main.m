clear; close all; clc

%% Exercici 2
% % Dibuixa la funcio definida a myF.m
% x = linspace(-1,4);
% y = myF(x);
% figure;
% plot(x,y)
% grid on

%% Exercici 3
% % Utilitzant biseccio_iter, fes niter operacions del metode de la biseccio
% % i escriu el valor de les aproximacions
% niter = input('nombre d''iteracions: ');
% Ini = [-1 4];
% [res err] = biseccio_iter(Ini, niter, @myF);
% res

%% Exercici 5
% % Escriu newton_iter que faci el metode de Newton, crea el fitxer mydF.m
% % amb la derivada de f
% niter = input('nombre d''iteracions: ');
% Ini = 3;
% [res err] = newton_iter(Ini, niter, @myF, @mydF);
% res(end)

%% Exercici 7
% % Escriu biseccio_tol i newton_tol
% tol = input('tolerància: ');
% Ini = [-1 4];
% [res_bisecio err_biseccio] = biseccio_tol(Ini, tol, @myF);
% res_bisecio(end)
% Ini = 3;
% [res_newton err_newton] = newton_tol(Ini, tol, @myF, @mydF);
% res_newton(end)

%% Exercici 8 - No se si es correcte
% Representa el logaritme dels error per Ini = [1, 2] i Ini = 1
Ini = [1 2];
[res_bisecio,err_biseccio] = biseccio_iter(Ini, 20, @myF);
Ini = 1;
[res_newton,err_newton] = newton_iter(Ini, 20, @myF, @mydF);
myp = [log(err_biseccio); log(err_newton)]';
figure;
plot(myp);
grid on;
