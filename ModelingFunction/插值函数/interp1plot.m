function interp1plot(x, y, xi, method)
    % 一维插值
    % x, y:     原始数据
    % xi:       差值点
    % method:   指定算法进行差值
    if nargin==3
        method = 'linear';
    end
    
    yi_nearest = interp1(x, y, xi, 'nearest');  % 临近点差值
    yi_linear = interp1(x, y, xi);              % 线性插值
    yi_spine = interp1(x, y, xi, 'spine');      % 三次样条差值
    yi_pchip = interp1(x, y, xi, 'pchip');      % Hermite差值
    yi_v5cubic = interp1(x, y, xi, 'v5cubic');  % 三次多项式差值
    
    figure;
    hold on;
    subplot(231);
        plot(x,y,'ro');								% 绘制数据点
        title('已知数据点');
    subplot(232);
        plot(x,y,'ro',xi,yi_nearest,'b-');			% 临近点插值
        title('临近点插值');
    subplot(233);	
        plot(x,y,'ro',xi,yi_linear,'b-');			% 线性插值
        title('线性插值');
    subplot(234);
        plot(x,y,'ro',xi,yi_spine,'b-');			% 三次样条插值
        title('三次样条插值');
    subplot(235);
        plot(x,y,'ro',xi,yi_pchip,'b-');			% 分段三次Hermite插值
        title('分段三次Hermite插值');
    subplot(236);
        plot(x,y,'ro',xi,yi_v5cubic,'b-');			% 三次多项式插值
        title('三次多项式插值');
    
    yi = interp1(x, y, xi, method);
    figure;
    plot(x,y,'ro',xi,yi,'b-');
    title(method);xlabel('x');ylabel('y');

end