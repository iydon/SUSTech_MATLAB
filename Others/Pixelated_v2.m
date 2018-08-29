% Initialize the image.
global I J circles
%{
[filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif','选择图片文件'});
I = imread(fullfile(pathname,filename));
%}
% I = imread('peppers.png');
I = im2double(I);
[height, width, channel] = size(I);
[height, width] = deal(2^(round(log(max(height, width))/log(2))));
I = imresize(I, [height, width]);
for i=1:3,I(:,:,i)=transpose(I(:,:,i));end

% Initialize the result.
J = ones(size(I));
imshow(J)
set(gcf, 'WindowButtonMotionFcn', @callback);

circles = containers.Map();
circles(num2str([height/2, width/2])) = height/2;

function callback(~, ~)
    position = get(gca, 'CurrentPoint');
    position = position([1 3]);
    try
        filled(position);
    catch
        % Nothing...
    end
end

function filled(position)
    global circles I J
    keys = circles.keys;
    for i=1:length(keys)
        radius = circles(keys{i});
        if radius<=1, continue; end
        key_pos = str2num(keys{i}); %#ok
        if ([0,0]<position) & ...
            (position<[size(I,1),size(I,2)]) %#ok
            if (0<abs(position-key_pos)) & ...
                (abs(position-key_pos)<[radius,radius]) %#ok
                less = @(i,j)key_pos+[i,j].*ones(1,2)*radius/2;
                % add/remove key(s).
                circles(num2str(less(1,1))) = radius/2;
                circles(num2str(less(1,-1))) = radius/2;
                circles(num2str(less(-1,1))) = radius/2;
                circles(num2str(less(-1,-1))) = radius/2;
                circles.remove(keys{i});
                % remove circle(s).
                J = insertShape(J, 'FilledRectangle', [key_pos-radius,2*radius,2*radius], 'Color', [1,1,1], 'Opacity', 1);
                % add circle(s).
                pos = deal(less(1,1));
                x0=pos(1); y0=pos(2);
                color = I(x0,y0,:); color = [color(1), color(2), color(3)];
                J = insertShape(J, 'FilledRectangle', [[x0,y0]-radius/2,radius,radius], 'Color', color, 'Opacity', 1);
                % -----------------------
                pos=deal(less(1,-1));
                x0=pos(1); y0=pos(2);
                color = I(x0,y0,:); color = [color(1), color(2), color(3)];
                J = insertShape(J, 'FilledRectangle', [[x0,y0]-radius/2,radius,radius], 'Color', color, 'Opacity', 1);
                % -----------------------
                pos=deal(less(-1,1));
                x0=pos(1); y0=pos(2);
                color = I(x0,y0,:); color = [color(1), color(2), color(3)];
                J = insertShape(J, 'FilledRectangle', [[x0,y0]-radius/2,radius,radius], 'Color', color, 'Opacity', 1);
                % -----------------------
                pos=deal(less(-1,-1));
                x0=pos(1); y0=pos(2);
                color = I(x0,y0,:); color = [color(1), color(2), color(3)];
                J = insertShape(J, 'FilledRectangle', [[x0,y0]-radius/2,radius,radius], 'Color', color, 'Opacity', 1);
                % -----------------------
                imshow(J);
                break
            end
        end
    end
end
