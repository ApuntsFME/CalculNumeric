function pesos = calculapesos(x,a,b)
    n = length(x)-1;
    
    c = zeros(n+1,1);
    c(1) = b-a;
    for i = 1:n
        c(i+1) = (b^(i+1)-a^(i+1))/(i+1);
    end
    
    A = zeros(n+1,n+1);
    
    for i = 1:n+1
        for j = 1:n+1
            A(i,j) = x(j)^(i-1);
        end
    end
    
    pesos = A\c;
end