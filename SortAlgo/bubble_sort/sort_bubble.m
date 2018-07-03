function [sortedArray,timerVal] = sort_bubble(unsortedArray)
    % 冒泡排序, 升序排列
    % argin:    unsortedArray(待排序的数组)
    % argout:   sortedArray(已排序的数组), timerVal(时间消耗)
    len = length(unsortedArray);
    
    tic;
    for i=len-1:-1:1
        for j=1:i
            if unsortedArray(j)>unsortedArray(j+1)
                tmp=unsortedArray(j);unsortedArray(j)=unsortedArray(j+1);unsortedArray(j+1)=tmp;
                % 即unsortedArray([j,j+1]) = unsortedArray([j+1,j]);
            end
        end
    end
    timerVal = toc;
    sortedArray = unsortedArray;
end