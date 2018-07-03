function [sortedArray,timerVal] = sort_selection(unsortedArray)
    % 选择排序, 升序排列
    % argin:    unsortedArray(待排序的数组)
    % argout:   sortedArray(已排序的数组), timerVal(时间消耗)
    len = length(unsortedArray);
    
    tic;
    for i=1:len
        idx = getMin(unsortedArray(i:len));
        % 即[~,idx]=min(unsortedArray(i:len));
        tmp=unsortedArray(i);unsortedArray(i)=unsortedArray(idx+i-1);unsortedArray(idx+i-1)=tmp;
        % 即unsortedArray([i,idx+i-1]) = unsortedArray([idx+i-1,i]);
    end
    timerVal = toc;
    sortedArray = unsortedArray;
end

function idx = getMin(array)
    for idx=1:length(array)
        if array(idx)<=array
            return;
        end
    end
end