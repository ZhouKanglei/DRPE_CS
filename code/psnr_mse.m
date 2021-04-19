function [psnr, mse] = psnr_mse(im1, im2)
    
    [m, n] = size(im1);

    mse = sum(sum(abs(double(im1) - double(im2)).^2))/(m*n);
    fprintf('MSE = %.4f\n', mse);

    psnr = 10*log10(255*255/mse);
    fprintf('PSNR = %.4f\n', psnr);

end