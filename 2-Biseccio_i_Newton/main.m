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

%% Exercici 8
% Representa el logaritme dels error per Ini = [1, 2] i Ini = 1
% Ini = [1 2];
% [res_bisecio,err_biseccio] = biseccio_iter(Ini, 20, @myF);
% Ini = 1;
% [res_newton,err_newton] = newton_iter(Ini, 20, @myF, @mydF);
% myp = [log(err_biseccio); log(err_newton)]';
% figure;
% plot(myp);
% grid on;

%% Adicional 1
% a) Esquema: x(k+1) = x(k) - myF(x(k)) * (x(k) - x(k-1))/(myF(x(k)) - myF(x(k-1)))
% b) Escribir secante_iter
% format long
% niter = input('nombre d''iteracions: ');
% [res_secante, err_secante] = secante_iter(0, 4, niter, @myF);
% figure;
% hold on;
% plot(-1:1/10:5, myF(-1:1/10:5));
% plot(-1:1/10:5, 0);
% stem(res_secante, myF(res_secante));
% % Prettyplot
% for (i=2:length(res_secante))
%     l = [res_secante(i-1), res_secante(i)];
%     plot(l, myF(l), 'g--o');
% end

%% Adicional 2
% a) Escribir whittaker_iter
% format long
% niter = input('nombre d''iteracions: ');
% [res_whittaker, err_whittaker] = whittaker_iter(1, -26, niter, @myF);
% figure;
% hold on;
% plot(-1:1/10:5, myF(-1:1/10:5));
% plot(-1:1/10:5, 0);
% stem(res_whittaker, myF(res_whittaker));

%% Adicional 3
% f = @(x) x.^5 - 2*x.^4 - 6*x.^3 + 12*x.^2 + 9*x - 18;
% df = @(x) 5*x.^4 - 8*x.^3 - 18*x.^2 + 24*x + 9;
% 
% [res_newton, err_newton] = newton_iter(3, 20, f, df);
% figure;
% hold on;
% plot(-2:1/10:4, f(-2:1/10:4));
% plot([-2 4], [0 0]);
% stem(res_newton, f(res_newton))