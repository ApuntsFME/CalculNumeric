%BASE SPLINE NATURAL C1
%function phi = Base(x,i)
clear; close all; clc

x = [0,1,3,4,5,7];
n = size(x,2);

% %SPLINE CUBIC C1
for i=1:n
    
y = zeros(1,n);
y(i) = 1;
dS = zeros(1,n);
[xS1,yS1,coeficients]=dibuixaSplineCubic(x,y,dS,[]);

 %SPLINE NATURAL
 y = zeros(1,n);
 y(i) = 1;
 d2S = calculaCurvaturesSplineNatural(x,y);
 d2S(1) = 0; d2S(n) = 0;
 [xS2,yS2,coeficients]=dibuixaSplineCubic(x,y,[],d2S);
 
 %SPLINE PARABÒLIC
 y = zeros(1,n);
 y(i) = 1;
 [xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y,0);
 
 if i == 1
     [xS4, yS4, coeficients] = dibuixaSplineC1Parabolic(x, zeros(1, length(x)), 1);
 end
 
 figure(1)
 subplot(n,1,i)
 plot(xS1,yS1,'r-',xS2,yS2,'b-',xS3,yS3,'g-',xS4, yS4, 'g--', x,y,'ko','LineWidth',2)
 legend('Cubic', 'Natural', 'Parabòlic')
 grid on
 
end

for i=1:n

%phi
y = zeros(1,n);
y(i) = 1;
dS = zeros(1,n);
[xS1,yS1,coeficients]=dibuixaSplineCubic(x,y,dS,[]);


%phi'
y1 = zeros(1,n);
dS1 = zeros(1,n);
dS1(i) = 1;
[xS2,yS2,coeficients]=dibuixaSplineCubic(x,y1,dS1,[]);
figure(2)
subplot(n,1,i)
plot(xS1,yS1,'r-',xS2,yS2,'b-',x,y,'ko','LineWidth',2)
legend('phi cubic', 'dphi cubic')
grid on

end
