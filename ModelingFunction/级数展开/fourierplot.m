function [A,B,Fcn] = fourierplot(f,x,n,a,b)
    % 傅里叶级数
    % F:        给定函数(函数句柄)
    % x:        自变量(符号表达式)
    % p:        展开项数
    % a, b:     展开区间
    if nargin==3
        a = -pi;
        b = pi;
    end
    
%-------------------------------------------------------------------------%
    L = (b-a)/2; 
    if a+b~=0
        f=subs(f,x,x+L+a);  % 区间
    end
    
    A = zeros(1, n+1);
    A(1) = int(f,x,-L,L) / L / 2;
    B = zeros(1, n+1);
    F = A(1);   %求a0/2
        
    for i = 1:n
        an = int(f*cos(i*pi*x/L),x,-L,L) / L; 
        bn = int(f*sin(i*pi*x/L),x,-L,L) / L;
        A(i+1) = an;
        B(i+1) = bn;
        F = F + an*cos(i*pi*x/L) + bn*sin(i*pi*x/L);
    end
    if a+b~=0
        F = subs(F,x,x-L-a); 
    end

    f=subs(f,x,x-L-a);
    Fcn = matlabFunction(F);
    f = matlabFunction(sym(f));
    figure;
    hold on;
    plotX = a:0.01:b;
    plot(plotX,f(plotX));
    plot(plotX,Fcn(plotX));
    legend('Function','Fourier');
    title('Fourier');xlabel('x');ylabel('y');
end