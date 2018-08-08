function Fitness = Calculate_Fitness(pic ,gene,triangle_num)
    max_diff = 255^3*3;
    % 由于图像为256*256，且为三通道，数据极差为255
    % 故在数据归一化时使用max_diff
    
    [W,L,~] = size(pic);
    triangle_point = gene(1:48*triangle_num);
    % 三角形的顶点由1::4800决定
    triangle_color = gene(48*triangle_num+1:72*triangle_num);
    % 三角形的颜色由4801:7200决定
    triangle_point = reshape(triangle_point,6*triangle_num,8);
    triangle_color = reshape(triangle_color,3*triangle_num,8);
    triangle_point = bin2dec(triangle_point) + 1;
    triangle_color = bin2dec(triangle_color);
    % 将用文本表示的二进制数字转换为十进制数字
    triangle_point = reshape(triangle_point,triangle_num,6);
    % 每行六个数据分别表示三个点的横纵坐标
    triangle_color = reshape(triangle_color,triangle_num,3);
    % 每行三个数据分别颜色的RGB
    pic_gene = insertShape(ones(W,L,3)*255,'FilledPolygon',triangle_point,'Color',triangle_color,'Opacity',0.7);
    % Insert shapes in image or video
    Fitness = abs(pic - pic_gene);
    Fitness = 1 - sum(Fitness(:))/max_diff;
    % 计算适应度
end

