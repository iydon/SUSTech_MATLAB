function [sortedArray] = sort_quick_recursion(unsortedArray)
    % 快速排序, 升序排列
    % argin:    unsortedArray(待排序的数组)
    % argout:   sortedArray(已排序的数组)
    
    if length(unsortedArray)<2
        sortedArray = unsortedArray;
        return
    end
    
    sortedArray = [sort_quick_recursion(unsortedArray(unsortedArray<unsortedArray(1))),...
                   unsortedArray(unsortedArray==unsortedArray(1)),...
                   sort_quick_recursion(unsortedArray(unsortedArray>unsortedArray(1)))];
    
end