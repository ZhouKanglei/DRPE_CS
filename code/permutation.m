function [ C ] = permutation( R )
    [m, n] = size(R);
    load(['keys/key_', num2str(m), '_', num2str(n), '.mat']);
    C = zeros(m, n);
    for i = 1:m
        for j = 1:n
            x = P1(i, j);
            y = P2(i, j);
            C(x, y) = R(i, j);
        end
    end
end

