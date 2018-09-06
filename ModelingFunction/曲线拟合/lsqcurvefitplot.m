function [coefficient, resnorm] = lsqcurvefitplot(dataX, dataY, fcn, x0)
    % 非线性曲线拟合
    % fcn:              fcn = @(coefficient, data)......
    % coefficient:      系数
    % resnorm:          残差
    % x, y:             数据
    % x0:               使用迭代，需要初始解向量
    len = length(dataX);
    if nargin==3
        x0 = zeros(len, 1);
    end
    dataX = reshape(dataX, len, 1);
    dataY = reshape(dataY, len, 1);
    
    
    [coefficient, resnorm] = lsqcurvefit(fcn, x0, dataX, dataY);
     ye = fcn(coefficient, dataX);
    
    figure;
    plot(dataX, dataY, 'bo');
    hold on;
    plot(dataX, ye, 'r:');
    legend('Raw Data', 'Lsqcurvefit');
    xlabel('x');ylabel('y');
end