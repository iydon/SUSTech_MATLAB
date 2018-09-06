function [polyCoefficient, err] = WLSplot(x, y, W, order)
    % 加权最小方差多项式拟合
    % 注意，加权矩阵应为正方形矩阵且维数与x元素个数相等
    % x, y:     数据点系列
    % W:        权重矩阵
    % order:    拟合阶数
    if nargin==3
        order = 1;
    end
    len = length(x);
    x = reshape(x, len, 1);
    y = reshape(y, len, 1);
    
    A(:,order+1) = ones(len, 1);
    for i = order:-1:1
        A(:,i) = A(:, i+1) .* x;
    end
    
    polyCoefficient = (W*A)\y;
    ye = polyval(polyCoefficient, x);
    err = norm(y-ye)/norm(y);
    
    figure;
    plot(x, y, 'bo');
    hold on;
    plot(x, ye, 'r:');
    legend('Raw Data', 'Polyfit');
    xlabel('x');ylabel('y');
end