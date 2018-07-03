function [sortedArray] = sort_quick_loop(unsortedArray)
    % 快速排序, 升序排列
    % argin:    unsortedArray(待排序的数组)
    % argout:   sortedArray(已排序的数组)
    
    sortedArray = quickSort(unsortedArray,1,length(unsortedArray));
end

function [array] = quickSort(array,low,high)
    if low<high
        [array,idx]=partition(array,low,high);
        % 取部分重新进行快速排序，分治
        array=quickSort(array,low,idx-1);
        array=quickSort(array,idx+1,high);
    end
end

function [array,idx] = partition(array,low,high)
    x=array(high);
    i=low-1;
    for j=low:high-1
        if array(j)<=x
            i=i+1;
            tmp=array(j);array(j)=array(i);array(i)=tmp;
            % 即array([i,j])=array([j,i]);
        end
    end
     tmp=array(i+1);array(i+1)=array(high);array(high)=tmp;
     % 即array([high,i+1])=array([i+1,high]);
     idx=i+1;
end
