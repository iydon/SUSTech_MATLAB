function interp2plot(x, y, z, xi, yi, method)
    % 二维差值
    % x, y:         数据范围
    % z:            观测数据
    % xi, yi:       差值范围
    % eg: [x,y]=meshgrid(-5:1:5); z=peaks(x,y); [xi,yi]=meshgrid(-5:0.8:5);
    if nargin==5
        method = 'linear';
    end
    
    zi_nearest=interp2(x,y,z,xi,yi,'nearest');		% 临近点插值
    zi_linear=interp2(x,y,z,xi,yi);					% 线性插值
    zi_spline=interp2(x,y,z,xi,yi,'spline');		% 三次样条插值
    zi_cubic=interp2(x,y,z,xi,yi,'cubic');			% 三次多项式插值
    
    figure;
    hold on;
    subplot(231);
        surf(x,y,z);				% 原始数据点
        title('原始数据');
    subplot(232);
        surf(xi,yi,zi_nearest);		% 临近点插值
        title('临近点插值');
    subplot(233);
        surf(xi,yi,zi_linear);		% 线性插值
        title('线性插值');
    subplot(234);
        surf(xi,yi,zi_spline);		% 三次样条插值
        title('三次样条插值');
    subplot(235);
        surf(xi,yi,zi_cubic);		% 三次多项式插值
        title('三次多项式插值');
        
     zi = interp2(x,y,z,xi,yi,method);
     figure;
     surf(xi,yi,zi);
     title(method);xlabel('x');ylabel('y');ylabel('z');

end