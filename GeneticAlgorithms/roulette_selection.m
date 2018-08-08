function new_population = roulette_selection(population, fitness_array, outstanding_gene, individual_amount, total_amount,triangle_num)
    % 轮盘赌法选择基因
    fitness_array_norm = fitness_array / sum(sum(fitness_array));
    % 适应度归一化
    fitness_array_cum = [0, cumsum(fitness_array_norm)];
    roulette_number = rand(1,individual_amount);
    survive_index = discretize(roulette_number ,fitness_array_cum);
    % 将数据分组到类别中；累加过程中适应度越大，区间数据越多
    new_population = zeros(72*triangle_num,total_amount);
    new_population(:,1:individual_amount) = population(:,survive_index);
    new_population(:,individual_amount+1:total_amount) = outstanding_gene;
    new_population = new_population(:,randperm(total_amount));
    % 随机置换，打乱new_population中的基因顺序
end