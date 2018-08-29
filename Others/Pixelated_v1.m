% Initialize the image.
%{
[filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif','选择图片文件'});
I = imread(fullfile(pathname,filename));
%}
global I
I = imread('peppers.png');
I = im2double(I);
[height, width, channel] = size(I);
[height, width] = deal(2^(round(log(max(height, width))/log(2))));
I = imresize(I, [height, width]);

% Initialize the result.
imshow(I)
set(gcf, 'WindowButtonMotionFcn', @callback);

global circles
circles = containers.Map();
circles(num2str([height/2, width/2])) = height/2;
% circles = {[height/2, width/2, height/2]};


function callback(~, ~)
    position = get(gca, 'CurrentPoint');
    position = position([1 3]);
    filled(position);
    drawed();
end

function filled(position)
    global circles I
    keys = circles.keys;
    for i=1:length(keys)
        radius = circles(keys{i});
        if radius<=1, continue; end
        key_pos = str2num(keys{i}); %#ok
        if ([0,0]<position) & (position<[size(I,1),size(I,2)]) %#ok
            if sum((position-key_pos).^2)<radius^2
                less = @(i,j)key_pos+[i,j].*ones(1,2)*radius/2;
                circles(num2str(less(1,1))) = radius/2;
                circles(num2str(less(1,-1))) = radius/2;
                circles(num2str(less(-1,1))) = radius/2;
                circles(num2str(less(-1,-1))) = radius/2;
                circles.remove(keys{i});
            end
        end
    end
end

function drawed()
    global circles I
    J = ones(size(I));
    keys = circles.keys;
    for i=1:length(keys)
        key_pos = str2num(keys{i}); %#ok
        position = [key_pos, circles(keys{i})];
        color = I(key_pos(2),key_pos(1),:);
        color = [color(1), color(2), color(3)];
        J = insertShape(J, 'FilledCircle', position, 'Color', color);
    end
    imshow(J);
end


