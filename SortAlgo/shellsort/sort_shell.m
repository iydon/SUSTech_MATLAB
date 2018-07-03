function [sortedArray,timerVal] = sort_shell(unsortedArray)
    % 希尔排序, 升序排列
    % argin:    unsortedArray(待排序的数组)
    % argout:   sortedArray(已排序的数组), timerVal(时间消耗)
    len = length(unsortedArray);
    gap = floor(len/2);
    
    tic;
    while gap>0
        for i=gap:len-1
            for j=i:-gap:gap
                if unsortedArray(j-gap+1)>unsortedArray(j+1)
                    tmp=unsortedArray(j-gap+1);unsortedArray(j-gap+1)=unsortedArray(j+1);unsortedArray(j+1)=tmp;
                    % 即unsortedArray([j-gap+1,j+1])=unsortedArray([j+1,j-gap+1]);
                    % 可以使用插入排序提高效率
                end
            end
        end
        gap = floor(gap/2);
    end
    timerVal = toc;
    
    sortedArray = unsortedArray;
end