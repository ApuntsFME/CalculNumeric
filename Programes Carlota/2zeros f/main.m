clear;
close all;
clc

myF2 = @(x)(x.^5 - 4*x.^4 + 7*x.^3 - 21*x.^2 + 6*x + 18);
%es una altra manera de declarar funcions (es declaren en linia)
%serveix per coses petitones:)
%si ho declarem aixi, llavors quan la cridem no cal posar @

xx = linspace(-1,4);
yy = myF(xx);
figure(1);
plot(xx, yy)
grid on  %graella

%% BISECCIO

[vect_x, vect_r] = biseccio_iter([1,2],15,@myF); %farem biseccio en linterval [1,2], 15 iteracions


%ARA HEM DE FER LA GRAFICA DE CONVERGENCIA

x2 = linspace(0,14,15); %fem de l'1 al 15 pq es el nombre d'iteracions q hem fet
y2 = vect_r;
figure(2);
plot(x2, log10(y2),'p-')
hold on

%% NEWTON

[vect_x, vect_r] = newton_iter(2.5,15,myF2, @myDF);

x3 = linspace(0,14,15); %fem de l'1 al 15 pq es el nombre d'iteracions q hem fet
y3 = vect_r;
figure(2);
plot(x3, log10(y3),'o-')
grid on
xlabel('iteracions k')
ylabel('log_1_0 r^k')
lg = legend('biseccio', 'newton');

vect_x(end)

%% NEWTON 2.0

[vect_x, vect_r] = newton_iter2(2.5, 15, @myF, 1e-10);

[r, s] = size(vect_r);

x4 = linspace(0,s,s);
y4 = vect_r;
figure(3);
plot(x4, log10(y4),'o-')
grid on
xlabel('iteracions k')
ylabel('log_1_0 r^k')
lg = legend('newton');

vect_x(end)