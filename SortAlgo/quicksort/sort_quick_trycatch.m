function [sortedArray] = sort_quick_trycatch(unsortedArray)
    % 快速排序, 升序排列
    % argin:    unsortedArray(待排序的数组)
    % argout:   sortedArray(已排序的数组)
    
    try
        sortedArray = [sort_quick_trycatch(unsortedArray(unsortedArray<unsortedArray(1))),...
                       unsortedArray(1),...
                       sort_quick_trycatch(unsortedArray(unsortedArray>unsortedArray(1)))];
    catch
        sortedArray = unsortedArray;
    end
    
end