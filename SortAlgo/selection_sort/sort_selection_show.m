function [sortedArray] = sort_selection_show(unsortedArray,pauseTime)
    % 选择排序, 升序排列
    % argin:    unsortedArray(待排序的数组), pauseTime(演示暂停时间)
    % argout:   sortedArray(已排序的数组)
    if nargin==1
        pauseTime = 0.01;
    end
    len = length(unsortedArray);
    scatter(1:len,unsortedArray);
    xlim([1,len])
    ylim([min(unsortedArray),max(unsortedArray)]);
    
    for i=1:len
        [~,idx] = min(unsortedArray(i:len));
        unsortedArray([i,idx+i-1]) = unsortedArray([idx+i-1,i]);
        pause(pauseTime);               % 暂停，产生动画效果
        scatter(1:len,unsortedArray);   % 绘制散点图
    end
    sortedArray = unsortedArray;
end