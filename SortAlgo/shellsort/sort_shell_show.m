function [sortedArray] = sort_shell_show(unsortedArray,pauseTime)
    % 希尔排序, 升序排列
    % argin:    unsortedArray(待排序的数组), pauseTime(演示暂停时间)
    % argout:   sortedArray(已排序的数组)
    if nargin==1
        pauseTime = 0.01;
    end
    len = length(unsortedArray);
    gap = 2;
    scatter(1:len,unsortedArray);
    
    while gap>0
        for i=gap:len-1
            for j=i:-gap:gap
                if unsortedArray(j-gap+1)>unsortedArray(j+1)
                    tmp=unsortedArray(j-gap+1);unsortedArray(j-gap+1)=unsortedArray(j+1);unsortedArray(j+1)=tmp;
                    % 即unsortedArray([j-gap+1,j+1])=unsortedArray([j+1,j-gap+1]);
                    pause(pauseTime);               % 暂停，产生动画效果
                    scatter(1:len,unsortedArray);   % 绘制散点图
                end
            end
        end
        gap = floor(gap/2);
    end
    
    sortedArray = unsortedArray;
end