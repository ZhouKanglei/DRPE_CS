function [ B, Y ] = de_embed( R, p )

    [m, n] = size(R);
    B = zeros(m, n);
    d = round(m*p);
    
    Y = R(:, [1:d]);
    bits = R(:, [d+1:n]);
    bits = reshape(bits, [], 1);
    bits = dec2bin(bits, 8);
    bits = reshape(bits, [], 1);
    bits = bin2dec(bits);
    B = reshape(bits, m, m);
    
    Y = double(Y);
    
end

