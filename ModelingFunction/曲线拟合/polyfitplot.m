function [polySym, err] = polyfitplot(dataX, dataY, order, sf)
    % 多项式拟合
    % dataX, dataY: 数据点系列
    % order:        多项式次数
    % sf:           有效位数
    if nargin==2
        order = 1;
        sf = 3;
    elseif nargin==3
        sf = 3;
    end
    
    len = length(dataX);
    dataX = reshape(dataX, 1, len);
    dataY = reshape(dataY, 1, len);
    
    p = polyfit(dataX, dataY, order);
    polySym = vpa(poly2sym(p), sf);

    ye = polyval(p, dataX);
    err = norm(dataY-ye)/norm(dataY);
    
    figure;
    plot(dataX, dataY, 'bo');
    hold on;
    plot(dataX, ye, 'r:');
    legend('Raw Data', 'Polyfit');
    xlabel('x');ylabel('y');
end