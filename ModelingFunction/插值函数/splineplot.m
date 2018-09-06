function splineplot(x, y, xx)
    % 样条差值
    % x,y:  数据点
    % xx:   差值范围
    if nargin==2
       xx = linspace(min(x),max(x),7*length(x));
    end
    
    yy = spline(x,y,xx);
    plot(x,y,'o',xx,yy);
    title('spline');xlabel('x');ylabel('y');
end