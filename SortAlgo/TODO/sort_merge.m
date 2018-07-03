function [sortedArray,timerVal] = sort_merge(unsortedArray)
    % 归并排序, 升序排列
    % argin:    unsortedArray(待排序的数组)
    % argout:   sortedArray(已排序的数组), timerVal(时间消耗)
    len = length(unsortedArray);
    
    sortedArray = mergeSort(unsortedArray, len);
end

function array = mergeSort(array, len)
    subGap = 1;
    gap = 2;

    while subGap<=len
        for i=1:gap:len-gap
            for j=i:i+gap-subGap
                if array(j)>array(j+subGap)
                    tmp=array(j);array(j)=array(j+subGap);array(j+subGap)=tmp;
                    % array([j,j+1])=array([j+1,j]);
                end
            end
        end
        subGap = subGap*2;
        gap = gap*2;
    end
end