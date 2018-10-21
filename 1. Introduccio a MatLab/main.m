clear; close all; clc

%% Exercici 1
% % 1) Defineix una matriu A amb coeficients aleatoris (enters entre 0 i 10) i escriu les
% %    instruccions necessaries per extreure la submatriu 2×2 formada pel primer i l’ultim
% %    coeficient de la primera i la darrera fila. Aquesta submatriu s’ha de poder extreure
% %    sigui quina sigui la dimensio de la matriu A.
% 
% n = input('nombre de files: ');
% m = input('nombre de columnes: ');
% 
% A = round(10*rand(n,m))
% 
% % Opcio A
% A([1,n], [1,m])
% 
% % Opcio B
% [nf, nc] = size(A)
% A([1,nf], [1,nc])

%% Exercici 2
% % Dibuixa la grafica de la funcio f(x) = x^2 - 3 per x pertanyent a (-1, 1)
% x = linspace(-1,1);
% y = f(x);       % f.m
% figure;
% plot(x,y)
% grid on

%% Exercici 3a
% % Donat n, torna S_n = \sum_{i=1}^n 1/(i^2)
% n = input('n: ');
% sum_n(n)

%% Exercici 3b
% % Dibuixeu l'aproximació per diferents n
% n_min = input('mínima n: ');
% n_max = input('màxima n: ');
% figure;
% for x = n_min:n_max
%     y = sum_n(x);
%     plot (x, y, '.')
%     hold on
% end
% grid on
% hold off

%% Exercici 3c
% % Troba l'error i fes la grafica de l'error
% %n_min = input('mínima n: ');
% %n_max = input('màxima n: ');
% figure;
% for x = n_min:n_max
%     y = (pi^2)/6-sum_n(x);
%     plot (x, y, '.')
%     hold on
% end
% grid on
% hold off

%% Exercici 3d
% % Troba l'error i fes la grafica de l'error
% tol = input('tolerància: ');
% [aprox_res iter] = sum_tol(tol);
% aprox_res
% iter

%% Exercici 4
% % Escriu una funcio Horner.m que donat els coeficients d'un polinomi i una 
% % x, retorni el polinomi avaluat en x
% c = input('vector de coeficients: ');
% x = input('x: ');
% Horner(c, x)