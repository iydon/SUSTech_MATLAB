%% 数据读取与参数设定
[filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif',...
                       '选择图片文件'});
% 读取文件
pic_origin = imread(fullfile(pathname,filename));
figure;
imshow(pic_origin);
% 读取并显示选择图片
individual_amount = 100;
% 种群数目
outstanding_gene_amount = 10;
% 卓越基因数目，本算法对卓越基因格外照顾
target_accuracy = 0.999;
% 目标准确率
generation_number = 100000;
% 最大代数，达到最大代数后即时没有达到目标准确率也停止
triangle_num = 3;
% 三角形个数
Pc = 0.7;   % 交叉概率
Pcn = 0.3;  % 交叉位置数目
Pm = 0.001; % 基因突变概率

%% 遗传算法主体
pic_out = GA_Triangle_Draw(pic_origin ,individual_amount ,outstanding_gene_amount ,target_accuracy ,generation_number ,Pc ,Pcn ,Pm,triangle_num);

%% 目标图像保存与显示
figure;
imshow(pic_out);
new_filename = regexp(filename,'(\w+)[.]','tokens');
new_filename = [new_filename{1}{1},'_Triangle.jpg'];
imwrite(pic_out,new_filename);