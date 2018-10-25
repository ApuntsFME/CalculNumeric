clear all
close all

figure(1)
title('interpolació polinòmica')
hold on
runge(2)
runge(4)
runge(6)
runge(8)
legend('funció','n = 2', 'n = 4', 'n = 6', 'n = 8')
hold off

figure(2)
title('mínims quadrats')
hold on
runge2(100, 2) 
runge2(100, 4) 
runge2(100, 6)
runge2(100, 8)
legend('funció','m = 2', 'm = 4', 'm = 6', 'm = 8')
hold off
