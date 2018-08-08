function pic_out = Draw_Picture(gene,triangle_num)
    % 绘图
    % 类似方法也在Calculate_Fitness里面使用
    triangle_point = gene(1:48*triangle_num);
    triangle_color = gene(48*triangle_num+1:72*triangle_num);
    triangle_point = reshape(triangle_point,6*triangle_num,8);
    triangle_color = reshape(triangle_color,3*triangle_num,8);
    triangle_point = bin2dec(triangle_point) + 1;
    triangle_color = bin2dec(triangle_color);
    triangle_point = reshape(triangle_point,triangle_num,6);
    triangle_color = reshape(triangle_color,triangle_num,3);
    pic_out = insertShape(ones(256,256,3)*255,'FilledPolygon',triangle_point,'Color',triangle_color,'Opacity',0.7);
    pic_out = uint8(pic_out);
end
