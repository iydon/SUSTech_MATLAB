function pic_out = GA_Triangle_Draw(pic_origin ,individual_amount ,outstanding_gene_amount ,target_accuracy ,generation_number ,Pc ,Pcn ,Pm,triangle_num)
    %% 数据预处理
    [W,L,~] = size(pic_origin);
    pic_resize = double(imresize(pic_origin,[256,256]));
    total_amount = individual_amount + outstanding_gene_amount;

    %% 创建种群
    population = char(randi([48,49],72*triangle_num,total_amount));
    % ACSII码48、49对应的值为0、1，以此表示二进制基因
    %且染色体长度为7200
    % optimal_fitness：最优适应度
    % optimal_gene：最优适应度对应的基因
    fitness_array = zeros(1,total_amount);

    %% 遗传算法
    figure('Name','optimal_gene');
    for generation_counter = 1:generation_number
        parfor i=1:total_amount
            % 并行计算适应度
            gene = population(:,i);
            fitness_array(i) = Calculate_Fitness(pic_resize,gene,triangle_num);
        end
        [optimal_fitness, idx] = max(fitness_array);
        optimal_gene = population(:,idx);
        % 筛选出最优适应度与对应的基因

        if optimal_fitness>=target_accuracy
            break;
        end

        %% 选择给定数量的最优子代，直接遗传到下一代
        [~,idx] = sort(fitness_array);
        outstanding_gene = population(:, idx(end-outstanding_gene_amount+1:end));

        %% 轮盘赌法选择基因
        new_population = roulette_selection(population,fitness_array,outstanding_gene,individual_amount, total_amount,triangle_num);
        % population：           种群
        % fitness_array：        适应度数组
        % outstanding_gene：     最优的基因
        % individual_amount：    种群数量
        % total_amount：         种群数量加最优基因的数量
        % triangle_num:              三角形个数
        
        %% 交叉基因
        new_population = crossover(new_population,outstanding_gene,Pc,Pcn,total_amount,outstanding_gene_amount,triangle_num);
        % new_population：           新的种群
        % outstanding_gene：         最优的基因
        % Pc：                       交叉概率
        % Pcn：                      交叉位置数目
        % total_amount：             种群数量加最优基因的数量
        % outstanding_gene_amount：  最优基因的数量
        % triangle_num:              三角形个数
        
        %% 基因突变
        population = mutation(new_population,outstanding_gene,Pm,total_amount,outstanding_gene_amount,triangle_num);
        % new_population：：         新的种群
        % outstanding_gene：         最优的基因
        % Pm：                       基因突变概率
        % total_amount：             种群数量加最优基因的数量
        % outstanding_gene_amount：  最优基因的数量
        % triangle_num:              三角形个数
        
        %% 数据输出
        disp(['generation_',num2str(generation_counter),': ',num2str(optimal_fitness)]);
        pic_out = Draw_Picture(optimal_gene,triangle_num);
        pic_out = imresize(pic_out,[W,L]);
        imshow(uint8(pic_out));
    end
    pic_out = Draw_Picture(optimal_gene,triangle_num);
    pic_out = imresize(pic_out,[W,L]);
end

