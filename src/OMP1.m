function [ x ] = OMP(y, Phi)
    [M, N] = size(Phi);
    K = ceil(M * 0.5);
    x_mmse = zeros(K, 1);
    support = zeros(K, 1);
    y_res = y;

    for t = 1 : K
        proj = Phi' * y_res;
        [~, pos] = max(abs( proj ));
        support( t ) = pos;
        x_mmse(1 : t) = Phi(:, support(1 : t)) \ y;
        y_res = y - Phi(:, support(1 : t)) * x_mmse(1 : t);
    end

    x = zeros(N, 1);
    x(support) = x_mmse;
end