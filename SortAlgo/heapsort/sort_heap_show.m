function [array] = sort_heap_show(array,pauseTime)
	% 堆排序, 升序排列
    % argin:    unsortedarrayrray(待排序的数组), pauseTime(演示暂停时间)
    % argout:   sortedarrayrray(已排序的数组)
    if nargin==1
        pauseTime = 0.01;
    end
    len = length(array);
    scatter(1:len,array);
	array = build_max_heap(array,len,pauseTime);

    for i=len:-1:2
	    array([1,i]) = array([i,1]);
	    len = len-1;
	    array = max_heapify(array,len,1,pauseTime);
    end
end

function [array] = build_max_heap(array,len,pauseTime)
    for i=floor(len/2):-1:1
    	array = max_heapify(array,len,i,pauseTime);
        pause(pauseTime);       % 暂停，产生动画效果
        scatter(1:len,array);   % 绘制散点图
    end
end

function [array] = max_heapify(array,len,i,pauseTime)
	left = 2*i;
	right = 2*i+1;
	largest = i;
	if left<=len
		if array(left)>array(i)
			largest = left;
		end

		if right<=len && array(right)>array(largest)
			largest = right;
		end

		if largest~=i
		    array([i,largest]) = array([largest,i]);
            pause(pauseTime);       % 暂停，产生动画效果
            scatter(1:length(array),array);   % 绘制散点图
		    array = max_heapify(array,len,largest,pauseTime);
		end
	end
end