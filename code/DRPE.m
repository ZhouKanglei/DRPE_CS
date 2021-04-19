function [ C1, phase] = DRPE(I, A1, B1)
    %producing the original image
    A = im2double(I);
    [m, n] = size(I);
    A11 = exp(i*2*pi*A1);   %mask1
    A111 = A.*A11;
    
    B = fft2(A111);
    B11 = exp(i*2*pi*B1);   % mask2
    B111 = B.*B11;
    C = ifft2(B111);
    
    ang = angle(C);   % phase image
    phase = ang*180/pi;
    C1 = abs(C);       % The Encrypted image

end
