% clear;clc;
%% Initial parameters
init;
%% DRPE for input image
I = imread('images/Lena_256.bmp'); 
I = imresize(I, [m, n]);                                     % input image
[Amp, phase] = DRPE(I, A_rand, B_rand);     % D: Decrypted image, C: Cipher image, phase: phase image
B = im2bw(phase);                                        % quantization <=0 -> 0 otherwise ->1
%% CS for host image
H = imread('images/Lena_256.bmp'); 
H = imresize(H, [m, n]);  
X_init = double(H);
%% DWT
X_dwt = full(W * sparse(X_init) * W');
X_dwt = im2col(X_dwt,[16, 16], 'distinct');
X_dwt = X_dwt';
%% CS
Y_H = Phi * X_dwt;
%% Quantization
[Y, Y_max, Y_min] = sigmoid( Y_H' );          % s -> [0, 255]
Y = round(Y);
%% Encryption process
R = embed(B, Y, p);
C = permutation(R);
%% Attack
C1 = C;
C = uint8(C);
% C = bitxor(C, tamp);
% C = imnoise(C, 'gaussian');
C = imnoise(C, 'salt & pepper', g);
C = double(C);
% rate_crop = 0.25;
% crop_m = ceil(256*sqrt(rate_crop));;
% crop_n = ceil(256*sqrt(rate_crop));;
% C(1:crop_m, 1:crop_m) = 0;
%% Decryption process
R_de = de_permutation(C);
[B_recover, Y_recover] = de_embed(R_de, p);
%% Phase recover
phase_recover = B_recover;
phase_recover(find(B_recover == 0)) = -pi;
phase_recover(find(B_recover == 1)) = pi;
%% Inverse DRPE
D = DRPE_inverse(phase_recover, A_rand, B_rand); 
%% Inverse quantization
Y_H_recover = reverse_sigmoid(Y_recover, Y_max, Y_min); %  [0, 255] -> s
Y_H_recover = Y_H_recover';
%% Recover CS of host image
X = CS_recover( Y_H_recover, d, repeats, Phi);
%% Inverse DWT
X = X';
X = col2im(X, [16,16], [256,256], 'distinct');
X = full(W' * sparse(X) * W);
%% Non-cross relation
[CC, PCE] = cross_relation(D, X);
%% PSNR & MSE
[psnr, mse] = psnr_mse(X, H);