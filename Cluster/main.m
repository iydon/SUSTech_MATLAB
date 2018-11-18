%% k-means聚类
%{
http://blog.csdn.net/taoyanqi8932/article/details/53727841
%}
%{
1、从D中随机取k个元素，作为k个簇的各自的中心。
2、分别计算剩下的元素到k个簇中心的距离，将这些元素分别划归到距离最小的簇。
3、根据聚类结果，通过算术平均值重新计算k个簇各自的中心。
4、将D中全部元素按照新的中心重新聚类。
5、重复第4步，直到簇的中心变化小于预期误差。
6、将结果输出。
%}
%{
优点：
1.是解决聚类问题的一种经典算法，简单、快速
2.对处理大数据集，该算法保持可伸缩性和高效率
3.当结果簇是密集的，它的效果较好
缺点：
1.在簇的平均值可被定义的情况下才能使用，可能不适用于某些应用
2.必须事先给出k（要生成的簇的数目），而且对初值敏感，对于不同的初始值，可能会导致不同结果。
3.不适合于发现非凸形状的簇或者大小差别很大的簇
4.对躁声和孤立点数据敏感
%}

%% 二维均匀分布
figure(1)
data = rand(2,10000);
kmeansII(data,10,100)
disp('Done')

%% 三维均匀分布
figure(2)
data = rand(3,10000);
kmeansIII(data,7,100)
disp('Done')

%% 非凸分布
data = rand(2,10000)*6-3;
dist = data(1,:).^2+data(2,:).^2;
loc = or(dist>27,and(dist<8,dist>1));
data(:,loc)=[];
figure(3)
kmeansII(data,2)
disp('Done')



%% 层次聚类
%{
http://blog.csdn.net/u012500237/article/details/65437525
https://www.cnblogs.com/xmeo/p/6543057.html
%}
%{
AGNES: bottom-up
DIANA: top-down
如果k-means类似于选择排序，那么层次聚类就相当于希尔排序与归并排序。
将问题分成若干子问题，通过递归迭代的分治算法求解。
%}



%% FCM聚类
%{
http://blog.csdn.net/zjsghww/article/details/50922168
%}



%% 非凸分布
data = rand(2,10000)*6-3;
dist = data(1,:).^2+data(2,:).^2;
loc = or(dist>9,and(dist<4,dist>1));
data(:,loc)=[];
data = data';

[center,U,obj_fcn] = FCMCluster(data,3); 
figure(4)
plot(data(:,1),data(:,2),'o'); 
figure(5)
index1=find(U(1,:)==max(U));    % 找出划分为第一类的数据索引 
index2=find(U(2,:)==max(U));    % 找出划分为第二类的数据索引 
index3=find(U(3,:)==max(U));    % 找出划分为第三类的数据索引 
scatter(data(index1,1),data(index1,2)); 
hold on; 
scatter(data(index2,1),data(index2,2)); 
hold on; 
scatter(data(index3,1),data(index3,2)); 
hold on; 
plot((center([1 2 3],1)),(center([1 2 3],2)),'*','color','k');

figure(6)
kmeansII(data',3,100,1e-5,0);
disp('Done')



%% 综合
load('testSynClusteringMatrix.mat')
scatter3(A(:,1),A(:,2),A(:,3));
title('原始数据')
pauseFlag = input('continue?');
synClust(A,3)



%% 神经网络聚类（APP）
% Iris Flower
load('iris_dataset')

% ctrl+r/t
% % 打开神经网络聚类APP
% data = irisInputs;
% idx = irisTargets;
% x = irisInputs(1,:);
% y = irisInputs(2,:);
% z = irisInputs(3,:);
% % 原始数据
% figure(1)
% scatter3(x,y,z);
% % 实际类型
% figure(2)
% scatter3(x(idx(1,:)==1),y(idx(1,:)==1),z(idx(1,:)==1),'r');
% hold on
% scatter3(x(idx(2,:)==1),y(idx(2,:)==1),z(idx(2,:)==1),'g');
% scatter3(x(idx(3,:)==1),y(idx(3,:)==1),z(idx(3,:)==1),'b');
% % 神经网络聚类结果
% figure(3)
% scatter3(x(output(1,:)==1),y(output(1,:)==1),z(output(1,:)==1));
% hold on
% scatter3(x(output(2,:)==1),y(output(2,:)==1),z(output(2,:)==1));
% scatter3(x(output(3,:)==1),y(output(3,:)==1),z(output(3,:)==1));
% scatter3(x(output(4,:)==1),y(output(4,:)==1),z(output(4,:)==1));



%% 函数
% keams二维
function kmeansII(data,numClust,maxIt,error,pauseTime)
    % 数据预处理
    %
    %
    if nargin<4,error=eps;pauseTime=1;end;if nargin<3,maxIt=1000;end
    len = length(data);
    tmp = randperm(len, numClust);
    idx = zeros(1,len);
    idx(tmp) = 1:length(tmp);
    centr = data(:,tmp);    % 中心
    colour = linspace(0,1,numClust);
	
    % 函数主体
    for it = 1:maxIt
        oldCentr = centr;
        scatter(centr(1,:),centr(2,:),50,'filled');
        hold on;
        
        for i=1:len
            [~,id] = min(sum((data(:,i)-centr).^2,1));
            idx(i) = id;
        end
        
        for i=1:numClust
            tmp = (idx==i);
            centr(:,i) = mean(data(:,tmp),2);
            scatter(data(1,tmp),data(2,tmp),20,ones(1,sum(tmp))*colour(i));
        end
        pause(pauseTime)
        hold off;
        
        if sum((oldCentr-centr).^2)<error
            % 达到精度后终止
            return;
        end
    end
    
end
% kmeans三维
function kmeansIII(data,numClust,maxIt,error)
    % 数据预处理
    if nargin<4,error=eps;end;if nargin<3,maxIt=1000;end
    len = length(data);
    tmp = randperm(len, numClust);
    idx = zeros(1,len);
    idx(tmp) = 1:length(tmp);
    centr = data(:,tmp);    % 中心
    colour = linspace(0,1,numClust);
	
    % 函数主体
    for it = 1:maxIt
        oldCentr = centr;
        scatter3(centr(1,:),centr(2,:),centr(3,:),50,'filled');
        hold on;
        
        for i=1:len
            [~,id] = min(sum((data(:,i)-centr).^2,1));
            idx(i) = id;
        end
        
        for i=1:numClust
            tmp = (idx==i);
            centr(:,i) = mean(data(:,tmp),2);
            scatter3(data(1,tmp),data(2,tmp),data(3,tmp),20,ones(1,sum(tmp))*colour(i));
        end
        pause(1)
        hold off;
        
        if sum((oldCentr-centr).^2)<error
            % 达到精度后终止
            return;
        end
    end
    
end
% FCM
function[center,U,obj_fun]=FCMCluster(data,cateNum,options)
	%采用模糊C均值将数据集data分为n类
	%用法
	% 1: [center,U,obj_fcn]=FCMCluster(data,n,options);
	% 2: [center,U,obj_fcn]=FCMCluster(data,n);

	% 输入
	% data			n*m矩阵，n个样本数，每个样本的维度为m
	% cateNum	   	类别数
	% options 4*1 	矩阵
	% options(1):	隶属度矩阵U的加权指数
	% options(2):	最大迭代次数
	% options(3):	隶属度最小变化量，迭代终止条件
	% options(4):	每次迭代是否输出信息标志
	% 输出
	% center	聚类中心
	% U			隶属度矩阵
	% obj_fun   目标函数值
    
    if nargin==2,options=[2;100;1e-5;0];end
	data_n = size(data,1);

	%将options 中的分量分别赋值给四个变量
	expo = options(1);
	max_iter = options(2);
	min_impro = options(3);
	display = options(4);
	obj_fun = zeros(max_iter,1);

	%初始化模糊分配矩阵
	U = initfcm(cateNum,data_n);


	%% 主程序
	for i=1:max_iter
		[U,center,obj_fun(i)]=stepfcm(data,U,cateNum,expo);
		if display
			fprintf('FCM:Iteration count=%d,obj_fun=%f\n',i,obj_fun(i));
		end
		%终止条件判别
		if i>1
			if abs(obj_fun(i)-obj_fun(i-1))<min_impro
				break;
			end
			end
	end
	iter_n=i;
	obj_fun(iter_n+1:max_iter)=[];
end
% 子函数 模糊矩阵初始化
function U = initfcm(cateNum,data_n)
	U = rand(cateNum,data_n);
	col_sum = sum(U);
	U = U./col_sum(ones(cateNum,1),:);
end
% 子函数 逐步聚类
function [U_new,center,obj_fun] = stepfcm(data,U,cateNum,expo)
	mf = U.^expo;
	center = mf*data ./ ( (sum(mf,2))*ones(1,size(data,2)) );
	dist = distfcm(center,data);
	obj_fun = sum( sum((dist.^2).*mf) );
	tmp = dist.^( -2/(expo-1) );
	U_new = tmp ./ ( ones(cateNum,1)*sum(tmp) );
end
% 子函数 计算距离
function out = distfcm(center,data)
	out = zeros(size(center,1),size(data,1));
	for k=1:size(center,1)
		out(k,:) = sqrt(sum(((data-repmat(center(k,:),size(data,1),1)).^2),2));
	end
end