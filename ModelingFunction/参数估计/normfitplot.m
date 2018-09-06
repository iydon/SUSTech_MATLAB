function [muhat, sigmahat, muci, sigmaci] = normfitplot(data, alpha)
    % 正态分布总体进行参数估计
    % data:             数据点系列
    % alpha:            计算(1-alpha)的置信区间
    % muhat, sigmahat:  估计值, 采用最大似然估计，也可使用mle
    %                   mle('norm',data,alph)
    % muci, sigmaci:    置信区间
    if nargin==1
        alpha = 0.05;
    end
    
    [muhat, sigmahat, muci, sigmaci] = normfit(data, alpha);
    
    figure;
    ye = linspace(0,1,length(data));
    scatter(data, ye, 5);
    data = sort(data);
    y = normpdf(data,muhat,sigmahat);
    hold on;
    plot(data, y);
    legend('Raw Data', 'Normal probability density function');
    xlabel('x');ylabel('ylabel');

    % 可以使用errorbar来显示置信区间。例如:
    % y=[10 6 17 13 20]; e=[2 1.5 1 3 1]; errorbar(y,e);
end