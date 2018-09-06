function [result_lores] = PCA(lores)
    % PCA dimensionality reduction
    % lores 的行数表示原始数据的维数， 列数表示数据的个数
    % 或者直接使用build-in函数pca
    C = double(lores * lores');
    [V, D] = eig(C);
    D = diag(D);                % perform PCA on features matrix 
    D = cumsum(D) / sum(D);
    k = find(D >= 1e-3, 1);     % ignore 0.1% energy
    V_pca = V(:, k:end);        % choose the largest eigenvectors' projection
    result_lores = V_pca' * lores;
end
