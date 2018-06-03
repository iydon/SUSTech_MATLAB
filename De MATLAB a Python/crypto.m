function y = crypto(x)
    p = 97;
    c1 = char(169);
    c2 = char(174);
    x(x==c1) = 127;
    x(x==c2) = 128;
    
    x = mod(real(x-32),p);
    
    n = 2*floor(length(x)/2);
    X = reshape(x(1:n),2,n/2);
    
    A = [71 2; 2 26];
    Y = mod(A*X,p);
    
    y = reshape(Y,1,n);
    
    if length(x) > n
        y(n+1) = mod((p-1)*x(n+1),p);
    end
    
    y = char(y+32);
    y(y==127) = c1;
    y(y==128) = c2;
end