function [sortedArray,timerVal] = sort_cocktail(unsortedArray,pauseTime)
    % 鸡尾酒排序, 升序排列
    % argin:    unsortedArray(待排序的数组), pauseTime(演示暂停时间)
    % argout:   sortedArray(已排序的数组), timerVal(时间消耗)
    if nargin==1
        pauseTime = 0.01;
    end
    len = length(unsortedArray);
end