function [ B_recover, phase_recover ] = quantization_inverse( water, M, N )
%% recover quantization_B with extracted watermark
    B_recover = [];
    [m_water, n_water] = size(water);
    for i = 1:n_water
        w = bin2dec(water(:, i));
        if sum(w) > 2
            B_recover = [B_recover 1];
        else
            B_recover = [B_recover 0];
        end
    end
    B_recover = uint8(reshape(B_recover, M, N));
%%    
    [m, n] = size(B_recover);
    for i = 1:m
        for j = 1:n
            if B_recover(i, j) == 0
                phase_recover(i, j) = -pi;
            else
                phase_recover(i, j) = pi;
            end
        end
    end
end

