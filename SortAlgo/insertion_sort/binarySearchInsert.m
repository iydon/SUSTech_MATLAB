function result = binarySearchInsert(array,entry)
    % 二分查找插入元素
	len = length(array);
	mid = floor(len/2);
	low = 1;
	high = len;
    
    if entry>array(high)
        result = [array,entry];
        return;
    elseif entry<array(low)
        result = [entry,array];
        return;
    end

    while high-low>1
		if entry>array(mid)
			low = mid;
			mid = ceil((low+high)/2);
            flag = true;
		elseif entry<array(mid)
			high = mid;
			mid = floor((low+high)/2);
            flag = false;
		else
			result = [array(1:mid-1),entry,array(mid:len)];
            return
		end
    end
    if flag
        result=[array(1:mid-1),entry,array(mid:len)];
    else
        result=[array(1:mid),entry,array(mid+1:len)];
    end
end