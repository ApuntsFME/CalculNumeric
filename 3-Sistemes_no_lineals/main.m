clear; close all; clc

% NewtonRaphson = newtonraphson([0 0 0], 30, @residu, @jacobiana)
% NewtonRaphsonModificat = newtonraphsonmodif([0 0 0], 30)

%% Adicional 1
% escribir numerical_jacobian
% numerical_jacobian(@residu, [0 0 0])

%% Adicional 2
% NewtonRaphson = newtonraphson([0 0 0], 30, @residu, @(x) numerical_jacobian(@residu, x);