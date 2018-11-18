function synClust(data, numClust)
    % data:         数据，应为table型
    % numClust:     聚类的类别数量
    
    %% 参数修改
    % 聚类变量与可视化变量
        versiableData = [data(:,1), data(:,2), data(:,3)];
    % K-Means聚类
        dist_k = 'cosine';            % kmeans
            % 'sqeuclidean', 'cityblock', 'cosine', 'correlation', 'hamming'
    % 层次聚类
        dist_h = 'spearman';          % clusterdata
        link = 'weighted';
    % 神经网咯聚类
        dimension1 = 3;
        dimension2 = 1;

    %% K-Means 聚类
    kidx = kmeans(data, numClust, 'distance', dist_k);
    % 绘制聚类效果图
    figure('Name','K-Means 聚类', 'NumberTitle','off');
    F1 = plot3(versiableData(kidx==1,1), versiableData(kidx==1,2),versiableData(kidx==1,3), 'r*', ...
               versiableData(kidx==2,1), versiableData(kidx==2,2),versiableData(kidx==2,3), 'bo', ...
               versiableData(kidx==3,1), versiableData(kidx==3,2),versiableData(kidx==3,3), 'kd');
    set(gca,'linewidth',2);
    grid on;
    set(F1,'linewidth',2, 'MarkerSize',8);
    xlabel('x','fontsize',12);
    ylabel('y','fontsize',12);
    zlabel('z','fontsize',12);
    title('Kmeans方法聚类结果')

    % 评估各类别的相关程度
    dist_metric_k = pdist(data,dist_k);
    dd_k = squareform(dist_metric_k);
    [~,idx] = sort(kidx);
    dd_k = dd_k(idx,idx);
    figure('Name','K-Means 聚类', 'NumberTitle','off');
    imagesc(dd_k)
    set(gca,'linewidth',2);
    xlabel('数据点','fontsize',12)
    ylabel('数据点', 'fontsize',12)
    title('k-Means聚类结果相关程度图', 'fontsize',12)
    ylabel(colorbar,['距离矩阵:', dist_k])
    axis square
    
    %% 层次聚类
    hidx = clusterdata(data, 'maxclust', numClust, 'distance' , dist_h, 'linkage', link);

    % 绘制聚类效果图
    figure('Name','层次聚类', 'NumberTitle','off');
    F2 = plot3(versiableData(hidx==1,1), versiableData(hidx==1,2),versiableData(hidx==1,3),'r*', ...
               versiableData(hidx==2,1), versiableData(hidx==2,2),versiableData(hidx==2,3), 'bo', ...
               versiableData(hidx==3,1), versiableData(hidx==3,2),versiableData(hidx==3,3), 'kd');
    set(gca,'linewidth',2);
    grid on
    set(F2,'linewidth',2, 'MarkerSize',8);
    set(gca,'linewidth',2);
    xlabel('x','fontsize',12);
    ylabel('y','fontsize',12);
    zlabel('z','fontsize',12);
    title('层次聚类方法聚类结果')

    % 评估各类别的相关程度
    dist_metric_h = pdist(data,dist_h);
    dd_h = squareform(dist_metric_h);
    [~,idx] = sort(hidx);
    dd_h = dd_h(idx,idx);
    figure('Name','层次聚类', 'NumberTitle','off');
    imagesc(dd_h)
    set(gca,'linewidth',2);
    xlabel('数据点', 'fontsize',12)
    ylabel('数据点', 'fontsize',12)
    title('层次聚类结果相关程度图')
    ylabel(colorbar,['距离矩阵:', dist_h])
    axis square

    % 计算同型相关系数
    Z = linkage(dist_metric_h, link);
    cpcc = cophenet(Z, dist_metric_h);
    disp('同型相关系数: ')
    disp(cpcc)

    % 层次结构图
    set(0,'RecursionLimit',5000)
    figure('Name','层次聚类', 'NumberTitle','off');
    dendrogram(Z)
    set(gca,'linewidth',2);
    set(0,'RecursionLimit',500)
    xlabel('数据点', 'fontsize',12)
    ylabel ('标准距离', 'fontsize',12)
     title('层次聚类法层次结构图')
     
   %% 神经网络
    % 设置网络
    
    net = selforgmap([dimension1 dimension2]);
    net.trainParam.showWindow = 0;

    % 训练网络
    [net,~] = train(net,data');
    nidx = net(data');
    nidx = vec2ind(nidx)';

    % 绘制聚类效果图
    figure('Name','神经网络聚类', 'NumberTitle','off');
    F3 = plot3(versiableData(nidx==1,1), versiableData(nidx==1,2),versiableData(nidx==1,3),'r*', ...
               versiableData(nidx==2,1), versiableData(nidx==2,2),versiableData(nidx==2,3), 'bo', ...
               versiableData(nidx==3,1), versiableData(nidx==3,2),versiableData(nidx==3,3), 'kd');
    set(gca,'linewidth',2);
    grid on
    set(F3,'linewidth',2, 'MarkerSize',8);
    xlabel('x','fontsize',12);
    ylabel('y','fontsize',12);
    zlabel('z','fontsize',12);
    title('神经网络方法聚类结果')

    %% 模糊C-Means聚类
    options = nan(4,1);
    options(4) = 0;
    [~,U] = fcm(data,numClust, options);
    [~, fidx] = max(U);
    fidx = fidx';

    % 绘制聚类效果图
    figure('Name','模糊C-Means聚类', 'NumberTitle','off');
    F4 = plot3(versiableData(fidx==1,1), versiableData(fidx==1,2),versiableData(fidx==1,3),'r*', ...
               versiableData(fidx==2,1), versiableData(fidx==2,2),versiableData(fidx==2,3), 'bo', ...
               versiableData(fidx==3,1), versiableData(fidx==3,2),versiableData(fidx==3,3), 'kd');
    set(gca,'linewidth',2);
    grid on
    set(F4,'linewidth',2, 'MarkerSize',8);
    xlabel('x','fontsize',12);
    ylabel('y','fontsize',12);
    zlabel('z','fontsize',12);
    title('模糊C-Means方法聚类结果')

    %% 高斯混合聚类 (GMM)
    gmobj = gmdistribution.fit(data,numClust);
    gidx = cluster(gmobj,data);

    % 绘制聚类效果图
    figure('Name','高斯混合聚类', 'NumberTitle','off');
    F5 = plot3(versiableData(gidx==1,1), versiableData(gidx==1,2),versiableData(gidx==1,3),'r*', ...
               versiableData(gidx==2,1), versiableData(gidx==2,2),versiableData(gidx==2,3), 'bo', ...
               versiableData(gidx==3,1), versiableData(gidx==3,2),versiableData(gidx==3,3), 'kd');
    set(gca,'linewidth',2);
    grid on
    set(F5,'linewidth',2, 'MarkerSize',8);
    xlabel('x','fontsize',12);
    ylabel('y','fontsize',12);
    zlabel('z','fontsize',12);
    title('高斯混合方法聚类结果')

   %% k-Means方法确定最佳的聚类类别数
    % 绘制几个典型类别数情况下的平均轮廓值图
    figure('Name','k-Means方法确定最佳的聚类类别数', 'NumberTitle','off');
    for i=2:4
        kidx = kmeans(data,i,'distance',dist_k);
        subplot(3,1,i-1)
        [~,F6] = silhouette(data,kidx,dist_k);
        xlabel('轮廓值','fontsize',12);
        ylabel('类别数','fontsize',12);
        set(gca,'linewidth',2);
        title([num2str(i) '类对应的轮廓值图 ' ])
        snapnow
    end



    % 计算平均轮廓值
    numC = 15;
    silh_m = nan(numC,1);
    for i=1:numC
        kidx = kmeans(data,i,'distance',dist_k,'MaxIter',500);
        silh = silhouette(data,kidx,dist_k);
        silh_m(i) = mean(silh);
    end

    % 绘制各类别数对应的平均轮廓值图
    figure('Name','平均轮廓值图', 'NumberTitle','off');
    F7 = plot(1:numC,silh_m,'o-');
    set(gca,'linewidth',2);
    set(F7, 'linewidth',2, 'MarkerSize',8);
    xlabel('类别数', 'fontsize',12)
    ylabel('平均轮廓值','fontsize',12)
    title('平均轮廓值vs.类别数')
end