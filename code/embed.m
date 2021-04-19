function [ R ] = embed(B, Y, p);
%% 
    [m, n] = size(Y);
    l = max(m, n);
    w = min(m, n);
    len = abs(l - w)*l;
 %%
     [m_B, n_B] = size(B);
     bits = reshape(B, 1, []);
     bits = dec2bin(bits, 1);
     bits = bits([1:m_B*n_B]);
     bits = reshape(bits, m_B*n_B/8, 8);
     bits = bin2dec(bits);
     bits = reshape(bits, m_B, n_B/8);
%%  
    R = uint8([Y bits]);
end

