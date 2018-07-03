function [sortedArray] = sort_bogo_show(unsortedArray,pauseTime)
    % 无限猴子排序, 升序排列
    % argin:    unsortedArray(待排序的数组), pauseTime(演示暂停时间)
    % argout:   sortedArray(已排序的数组)
    if nargin==1
        pauseTime = 0.01;
    end
    len = length(unsortedArray);
    scatter(1:len,unsortedArray);

    while 1
        for i=1:len
            j = randi([1,len]);
            unsortedArray([i,j]) = unsortedArray([j,i]);
            pause(pauseTime);               % 暂停，产生动画效果
            scatter(1:len,unsortedArray);   % 绘制散点图
        end
        if unsortedArray(1:len-1)<unsortedArray(2:len)
            break;
        end
    end
    sortedArray = unsortedArray;
end