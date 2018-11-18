%% 二维均匀分布
figure(1)
data = rand(2,10000);
kmeansII(data,3,100)
disp('Done')

%% 三维均匀分布
figure(2)
data = rand(3,10000);
kmeansIII(data,7,100)
disp('Done')

%% 已有数据
load('testSynClusteringMatrix.mat');
data = A';
figure(3);
kmeansIII(data,3,1000)
disp('Done')

%% 块型区域
x1 = linspace(1,2,500)+rand(1,500);
y1 = linspace(1,2,500)+rand(1,500);
x2 = linspace(2.5,3.5,50)+rand(1,50);
y2 = linspace(2.5,3.5,50)+rand(1,50);
data = [x1,x2;y1,y2];
figure(4)
scatter(x1,y1)
hold on
scatter(x2,y2)
figure(5)
kmeansII(data,4)
disp('Done')

%% 同心圆区域
data = rand(3,10000)*6-3;
dist = data(1,:).^2+data(2,:).^2+data(3,:).^2;
loc = or(dist>27,and(dist<8,dist>1));
data(:,loc)=[];
kmeansIII(data,3)
disp('Done')

%% 二维
function kmeansII(data,numClust,maxIt,error)
    %% 数据预处理
    if nargin<4,error=eps;end;if nargin<3,maxIt=1000;end
    len = length(data);
    tmp = randperm(len, numClust);
    idx = zeros(1,len);
    idx(tmp) = 1:length(tmp);
    centr = data(:,tmp);    % 中心
    colour = linspace(0,1,numClust);
	
    %% 函数主体
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
        pause(1)
        hold off;
        
        if sum((oldCentr-centr).^2)<error
            % 达到精度后终止
            return;
        end
    end
    
end

% 三维
function kmeansIII(data,numClust,maxIt,error)
    %% 数据预处理
    if nargin<4,error=eps;end;if nargin<3,maxIt=1000;end
    len = length(data);
    tmp = randperm(len, numClust);
    idx = zeros(1,len);
    idx(tmp) = 1:length(tmp);
    centr = data(:,tmp);    % 中心
    colour = linspace(0,1,numClust);
	
    %% 函数主体
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