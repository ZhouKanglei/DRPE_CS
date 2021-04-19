function [ CC2, pce ] = cross_relation( d, t )
    K = 0.3;  % The  nonlinear  cross-correlation  transform cc(x,y) between the decrypted image d(x,y) and the target image t(x,y) 
    T = fft2(fftshift(double(t)));  %  the 2D Fourier transforms of the target t(x,y) 
    D = fft2(fftshift(double(d))); %  the 2D Fourier transforms of the target d(x,y) 
    ang_T = angle(T);  % phase image
    ang_D = angle(D); % phase image

    CC = fftshift(ifft2((abs(T.*D).^K.*exp(i*(ang_T - ang_D)))));
    
    CC1= abs(CC);
    CC2 = CC1/max(max(CC1));
   
    [m, n] = size(CC1);
    pce = max(max(CC1.^2))/sum(sum(CC1.^2));
    fprintf('PCE = %.6f\n', pce);
end

