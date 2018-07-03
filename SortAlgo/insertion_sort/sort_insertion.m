function [sortedArray,timerVal] = sort_insertion(unsortedArray)
    % 插入排序, 升序排列
    % argin:    unsortedArray(待排序的数组)
    % argout:   sortedArray(已排序的数组), timerVal(时间消耗)
    len = length(unsortedArray);
    sortedArray = unsortedArray(1);
    
    tic;
    for i=2:len
        entry = unsortedArray(i);
        sortedArray = [sortedArray(sortedArray<entry),entry,sortedArray(sortedArray>=entry)];
        % 实际应采用二分法插入数值
    end
    timerVal = toc;
end