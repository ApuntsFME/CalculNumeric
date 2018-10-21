%% Size vs Length
% size(A) retorna les dimensions de la matriu:
    [row columns] = size(A);
% length(A) retorna la longitud de la ``dimensio'' mes llarga
    ret = length(A);

%% Plot de uns quants punts
    figure;
    for x = n_min:n_max
        y = (pi^2)/6-sum_n(x);
        plot (x, y, '.')
        hold on
    end
    grid on
    hold off
    
%% Inputs
    coef = input('vector de coeficients: ');

%% Outputs
% Per posar ', posa-ho com '' al string
    name = 'Alice';   
    age = 12;
    X = sprintf('%s will be %d this year.',name,age);
    disp(X)
% output: Alice will be 12 this year.