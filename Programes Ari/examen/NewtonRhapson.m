%2 dimensions
function [x1, r] = NewtonRhapson(t, phi, xs, f, J)
tol = 10^(-xs); 
x = [t;phi];
error = 1; 
found = 0; 

fprintf('                 Newton-Rhapson\n')

if norm(f(x)) < tol
    display('Aprox inicial = optim')
    x1 = x; 
    r = 0; 
    return; 
end

display('i                       r(i)                x(i)')
display('--------------------------------------------------')

i = 0; 

while((error == 1 || found == 0) && i < 1000)
    i = i + 1; 
    %DEDUCCI� INCREMENT
    %{
    �dem que per newton normal: 
    x(k+1)=x(k)+delta(x(k)) -> 0=f(x(k+2))=f(x(k)+delta(x(k))~=(Taylor)
    f(x(k))+J(x(k))*delta(x(k)) i d'aqu� increment = delta(x(k)). 
    %}
    increment = -(J(f,x))^(-1)*f(x);
    x1 = x + increment; 
    if(i == 1)
        r = norm(x-x1)/norm(x1);
    else
        r = [r, norm(x-x1)/norm(x1)];
    end
    
    fprintf('%d                   ', i)
    formatSpec = '%1.7f'; 
    fprintf(formatSpec, r(i));
    fprintf('            %1.7f \n', x1(1));
    fprintf('                                        %1.7f \n', x1(2));
    fprintf('                                        %1.7f \n', x1(3));
    
    x = x1;
    
    %comprovar si hem arribat exactament a l'optim (not sure why)
    %{
    if(norm(f(x1)) == 0)
        error = 0; %     if(r(i) == inf)
%        error = 0; 
%        found = 1; 
%     end%%

        found = 1; 
    end
    %}
    
    if tol >= r(i)
        error = 0;
    end
    if tol >= norm(f(x1))
        found = 1; 
    end
    
    %si l'he liat amb aprox inicial caca
    %if(r(i) == inf)
    %    error = 0; 
    %    found = 1; 
    %end
    
end

end