function [sortedArray] = sort_insertion_show(unsortedArray,pauseTime)
    % 插入排序, 升序排列
    % argin:    unsortedArray(待排序的数组), pauseTime(演示暂停时间)
    % argout:   sortedArray(已排序的数组)
    if nargin==1
        pauseTime = 0.01;
    end
    len = length(unsortedArray);
    sortedArray = unsortedArray(1);
    scatter(1:len,unsortedArray);
    
    for i=2:len
        entry = unsortedArray(i);
        sortedArray = [sortedArray(sortedArray<entry),entry,sortedArray(sortedArray>=entry)];
        pause(pauseTime);	% 暂停，产生动画效果
        scatter(1:i,sortedArray);
        hold on;
        scatter(i+1:len,unsortedArray(i+1:len));	% 绘制散点图
        hold off;
    end
end