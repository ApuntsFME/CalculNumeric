%% Formats
Format short 
Format long
Format short e
Format long e

%% Size vs Length
% size(A) retorna les dimensions de la matriu:
    [row columns] = size(A);
% length(A) retorna la longitud de la ``dimensio'' mes llarga
    ret = length(A);

%% Plot
% Per fer el plot d'uns quans punts
    figure;
    for x = n_min:n_max
        y = (pi^2)/6-sum_n(x);
        plot (x, y, '.')        % Tambe es pot deixar en blanc o posar '*', '.-', etc.
        hold on
    end
    grid on
    hold off

% Per fer el plot d'una funcio, agafem x el seguent
x = linspace(x1,x2,n)       % n punts entre x1 i x2
x = linspace(x1,x2)         % 100 punts entre x1 i x2
% llavors fem 
y = sin(x);
figure;
plot(x,y);                  % Tambe es pot deixar en blanc o posar '*', '.-', etc.
grid on
    
%% Inputs
    coef = input('vector de coeficients: ');

%% Outputs
% Per posar ', posa-ho com '' al string
    name = 'Alice';   
    age = 12;
    X = sprintf('%s will be %d this year.',name,age);
    disp(X)
% output: Alice will be 12 this year.

%% While amb ands
while x > tol && iter < max_iter
    ...
end