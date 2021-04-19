function [F] = DRPE_inverse(I, A1, B1)

    A = im2double(I);
    [m, n] = size(I);
  
    %%
    C = A;
    D = fft2(C);
    D1 = D.*exp(-i*2*pi*B1);
    D11 = ifft2(D1);
    D111 = D11.*exp(-i*2*pi*A1);
    F = abs(D11); 

end
