function new_population = mutation(new_population,outstanding_gene,Pm,total_amount,outstanding_gene_amount,triangle_num)
    % 基因突变
    mutation_index = rand(72*triangle_num,total_amount)<Pm;
    new_population = char(uint8(xor(new_population>48,mutation_index))+48);
    % 将数值转化为二进制基因表示
    tmpIdx = total_amount-outstanding_gene_amount+1:total_amount;
    new_population(:,tmpIdx) = outstanding_gene;
end