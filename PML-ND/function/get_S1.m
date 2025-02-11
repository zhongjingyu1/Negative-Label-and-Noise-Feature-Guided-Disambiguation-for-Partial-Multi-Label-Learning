function [S]=get_S1(train_data,train_target,num_p,num_n)
    [~, num_class] = size(train_target);
%     P = cell(1, num_class);
%     N = cell(1, num_class);
    S = cell(1, num_class);
    for k = 1:num_class
        p_instance = train_data(train_target(:, k) == 1, :);
%         n_instance = train_data(train_target(:, k) == 0, :);
%         P{1, k} = p_instance;
%         N{1, k} = n_instance;
        mean_p = mean(p_instance, 1);
%         mean_n = mean(n_instance, 1);
%         s_k = (mean_p - mean_n).^2;
        s_k_p = sum(p_instance - mean_p, 1);
%         s_k_n = sum(n_instance - mean_n, 1);
        num_p1 = size(p_instance, 1); % |P_k|
%         num_n = size(n_instance, 1); % |N_k|
        S_k = diag(- (num_p+num_n) * s_k_p / (2*num_p1));
        S{1, k} = S_k;
    end
end