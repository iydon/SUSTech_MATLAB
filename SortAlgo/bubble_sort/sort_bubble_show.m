function [sortedArray] = sort_bubble_show(unsortedArray,pauseTime)
    % 冒泡排序, 升序排列
    % argin:    unsortedArray(待排序的数组), pauseTime(演示暂停时间)
    % argout:   sortedArray(已排序的数组)
    if nargin==1
        pauseTime = 0.01;
    end
    len = length(unsortedArray);
    scatter(1:len,unsortedArray);
    
    for i=len-1:-1:1
        for j=1:i
            if unsortedArray(j)>unsortedArray(j+1)
                tmp=unsortedArray(j);unsortedArray(j)=unsortedArray(j+1);unsortedArray(j+1)=tmp;
                % 即unsortedArray([j,j+1]) = unsortedArray([j+1,j]);
            end
            pause(pauseTime);               % 暂停，产生动画效果
            scatter(1:len,unsortedArray);   % 绘制散点图
        end
    end
    sortedArray = unsortedArray;
end