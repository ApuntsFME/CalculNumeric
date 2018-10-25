clear all; close all;

% Utilitza els programes de la carpeta

load('data.mat');

N = 6;
c0 = ([a0;b0]);

E = @(x)(sum((fpoints - g(points, x(1:N), x(N+1:2*N))).^2) + sum((dfpoints - dg(points,x(1:N), x(N+1:2*N))).^2));

maxIter = 100;
tol = 0.5*10^(-4);
rk = 2*tol;
k = 0;

matSol = zeros(2*N,maxIter);

while (rk > tol && k < maxIter) % && es un i
    r0 = numericalDerivative(E, c0);
    J0 = numericalHessian(E, c0);
    inc = -J0\r0;
    c1 = c0 + inc;
    
    rk = norm(inc)/norm(c1);
    matSol(:,k+1) = c1;
    vectRk(k+1) = rk;
    
    c0 = c1;
    k = k+1;
  
end

Error = E(c0);

iter = k;
rel = vectRk

a = c0(1:N)
b = c0(N + 1:2*N)

niter = 1:iter;
figure;
plot(niter,log10(rel), '*-')
grid on
xlabel('iteracions k')
ylabel('log_{10} r^k')
