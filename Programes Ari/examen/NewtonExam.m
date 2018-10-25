clear all; close all;
load dades.mat %X,T,Nint 

t=[0;0]; 
theta=0;
xk = [t;theta];
fprintf('\nNewton...\n')
k = 0; relErr = zeros(100,1); convergence = 0;
F = @(x)(phi(x));
while(( convergence==0) && k<100)
    Fx = F(xk);
    DFx = numericalDerivative(F,xk); % avaluacio de la derivada numerica de F
    HFx = numericalHessian(F,xk);    % avaluacio de la Hessiana numerica de F
    
    deltaX = -(HFx)\DFx; 
    xkp1 = xk + deltaX;
    
    relErr(k+1) = norm(xkp1-xk)/norm(xkp1);
    convergence = relErr(k+1)<1.e-4;
    
    fprintf(' Iteracio %2d: Error Quadràtic = %2.7f, Error relatiu r = %4.2e\n',k,Fx,relErr(k+1))
    k = k+1; xk = xkp1;
end
xk

figure; plot(0:k-1,log10(relErr(1:k)),'-o')
xlabel('k'), ylabel('log_{10}(r^k)')