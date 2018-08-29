% Initialize the image.
% I = imread('peppers.png');
I = im2double(I);
[height, width, channel] = size(I);
[height, width] = deal(2^(round(log(max(height, width))/log(2))));
I = imresize(I, [height, width]);

% Initialize the result.
J = ones(height, width, channel);
radius = height;
kernel = fspecial('average', radius);
filter = imfilter(I, kernel, 'replicate');

for i=1:round(log(max(height, width))/log(2))-1
    radius = height/2^i;
    kernel = fspecial('average', radius);
    filter = imfilter(I, kernel, 'replicate');
    tmpImg = circle(J,2^i,filter);
    imshow(tmpImg)
    pause(1);
end

function I = circle(I, number, filter)
    height = size(I, 1);
    radius = height/number/2;
    [position, color] = deal(zeros(number*number, 3));    
    count = 0;
    for i=1:number
        for j=1:number
            count = count + 1;
            position(count,:) = [radius*(2*i-1), radius*(2*j-1), radius];
            tmp = filter(position(count,2),position(count,1),:);
            color(count,:) = [tmp(1),tmp(2),tmp(3)];
        end
    end
	I = insertShape(I, 'FilledCircle', position, 'Color', color);
end


