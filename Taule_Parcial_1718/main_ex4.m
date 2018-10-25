clear all; close all;

load('dades.mat');


maxIter = 100;
tol = 0.5*10^(-4);
rk = 2*tol;
k = 0;
Ini = [0;0;0];

matSol = zeros(3,maxIter);

x0 = Ini;
MyFun = @(x)(F(x));

while (rk > tol && k < maxIter) % && es un i
    r0 = F(x0);
    J0 = Jacobian(MyFun,x0);
    inc = -J0\r0;
    x1 = x0 + inc;
    
    rk = norm(inc)/norm(x1);
    matSol(:,k+1) = x1;
    vectRk(k+1) = rk;
    
    x0 = x1;
    k = k+1;
  
end

iter = k - 1;
rel = vectRk;

niter = 1:k;
figure;
plot(niter,log10(rel), '*-')
grid on
xlabel('iteracions k')
ylabel('log_{10} r^k')

t1 = x0(1);
t2 = x0(2);
f1 = x0(3);

sol = [t1;t2;f1]


%Ara fem l'aproximació per mínims quadrats

E = @(x)(F1(x));


tol = 0.5*10^(-4);
rk = 2*tol;
k = 0;
x0 = [0;0;0];
matSol = zeros(3,maxIter);

while (rk > tol && k < maxIter) % && es un i
    r0 = numericalDerivative(E, x0);
    J0 = numericalHessian(E, x0);
    inc = -J0\r0;
    x1 = x0 + inc;
    
    rk = norm(inc)/norm(x1);
    matSol(:,k+1) = x1;
    vectRk(k+1) = rk;
    
    x0 = x1;
    k = k+1;
  
end


iter2 = k - 1;
rel2 = vectRk;
sol2 = x0



niter = 1:k;
figure;
plot(niter,log10(rel2), '*-')
grid on
xlabel('iteracions k')
ylabel('log_{10} r^k')


