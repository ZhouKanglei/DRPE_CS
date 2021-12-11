function [ R_de ] = de_permutation( C )
    [m, n] = size(C);
    load(['keys/key_', num2str(m), '_', num2str(n), '.mat']);
    R_de = zeros(m, n);
    for i = 1:m
        for j = 1:n
            
            x = P1(i, j);
            y = P2(i, j);
            
            R_de(i, j) = C(x, y);
            
        end
    end
    
    R_de = uint8(R_de);
end

