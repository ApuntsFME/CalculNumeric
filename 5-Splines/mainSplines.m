% CALCUL I DIBUIX D'SPLINES
% Aquest script calcula i dibuixa l'Spline cubic C1 amb aproximaci? de les
% derivades, per als punts base i valors de la funcio a x i y.
%
% EXERCICIS:
% (1) Mira l'ajuda i el codi de la funcio dibuixaSplineCubic per veure que fa.
% (2) Implementa una funcio amb cap?alera 
%        function d2S = calculaCurvaturesSplineNatural(x,y)
%     que donats x i y, calculi les curvatures als punts base corresponents
%     a l'Spline natural. Descomenta les linies corresponents a l'Spline
%     natural a aquest codi. Observa els dos Splines. Son raonables els
%     resultats?
% (3) Implementa l'Spline C1 parabolic fent una aproximaci? de la derivada
%     per al primer punt. Dibuixa l'aproximaci? obtinguda.
% (4) Per a cada un dels Splines dibuixa (i) l'aproximaci? amb les dades
%     donades i (ii) modificant el valor del 3er punt de 1 a 2. Observa
%     on i quant afecta la modificaci? del valor en cada cas.
% (5) Dibuixa la base de cada un dels Splines. Es una base local? Explica
%     aix? el comportament dels Spline a l'apartat anterior?
%     (Pot ser util la funcio subplot)

%Dades
x = [0,1,3,4,5,7]; y = [1,1.25,1,0.5,0,0.4];
%x = [0,1,3,4,5,7]; y = [1,1.25,2,0.5,0,0.4];

% %Spline C1 cubic amb aproximacio de les derivades
i = 2:length(x)-1;
dS = [ (y(2)-y(1))/(x(2)-x(1)) (y(i-1)-y(i+1))./(x(i-1)-x(i+1)) (y(end)-y(end-1))/(x(end)-x(end-1))]
[xS1,yS1,coeficients1]=dibuixaSplineCubic(x,y,dS,[]);
coeficients1
figure
plot(xS1,yS1,'r-',x,y,'ko','LineWidth',2)
legend('C1 cubic')

%Spline natural
d2S = calculaCurvaturesSplineNatural(x,y)
[xS2,yS2,coeficients2]=dibuixaSplineCubic(x,y,[],d2S);
coeficients2
figure(1)
plot(xS1,yS1,'r-',xS2,yS2,'b-',x,y,'ko','LineWidth',2)
legend('C1 cubic','Natural')

% %Spline parabolic C1 (recurrent)
[xS3,yS3,coeficients3]=dibuixaSplineC1Parabolic(x,y,dS(1));
coeficients3
figure(1)
plot(xS1,yS1,'r-',xS2,yS2,'b-',xS3,yS3,'g-',x,y,'ko','LineWidth',2)
legend('C1 cubic','Natural','parabolic')

%% Bases
figure(2);
hold on;

coeficientes = zeros(5, 3);

for i = 1:length(x)
    yB = zeros(1, length(x));
    yB(i) = 1;
    
    k = 2:length(x)-1;
    %dSB = [ (yB(2)-yB(1))/(x(2)-x(1)) (yB(k-1)-yB(k+1))./(x(k-1)-x(k+1)) (yB(end)-yB(end-1))/(x(end)-x(end-1))];
    dSB1 = zeros(1, length(x));
    [xB1,yB1,coef1] = dibuixaSplineCubic(x, yB, dSB1, []);
    dSB1(i) = 1;
    [xDB1, yDB1, coef1] = dibuixaSplineCubic(x, zeros(1, length(x)), dSB1, []);

    d2SB = calculaCurvaturesSplineNatural(x, yB);
    [xB2, yB2, coef2] = dibuixaSplineCubic(x, yB, [], d2SB);

    [xB3, yB3, coef3] = dibuixaSplineC1Parabolic(x, yB, 0);
    coeficientes = coeficientes + coef3*y(i);
    if (i == 1)
      [xB3d, yB3d, coef3] = dibuixaSplineC1Parabolic(x, zeros(1, length(x)), 1);
      coeficientes = coeficientes + coef3*dS(1);
    end
    
    subplot(4, 2, i);
    hold on;
    if (i == 1)
      h = plot(xB1, yB1, 'b-', xDB1, yDB1, 'b--', xB2, yB2, 'r-', xB3, yB3, 'g-', xB3d, yB3d, 'g--', [xB1(1), xB1(end)], [0, 0]);
    else
      plot(xB1, yB1, 'b-', xDB1, yDB1, 'b--', xB2, yB2, 'r-', xB3, yB3, 'g-', [xB1(1), xB1(end)], [0, 0]);
    end
    stem(x, yB);
end

coeficients3 - coeficientes

hL = subplot(4, 2, 7.5);
poshL = get(hL,'position');

lgd = legend(hL, h, 'C1 cubic', 'C1 cubic derivades', 'Natural','parabolic', 'parabolic derivat');
set(lgd,'position',poshL);
axis(hL,'off');

%plot(xB2i, yB2, 'r-');
%plot([xB2i(1), xB2i(end)], 0);
