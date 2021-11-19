% clear;clc;close all;
%% Initial parameters
init;
%% DRPE for input image
I = imread('images/Lena_512.bmp'); 
I = imresize(I, [m, n]);                   % input image
% I(1,256) = bitxor( I(63,195), 1 );
[Amp, phase] = DRPE(I, A_rand, B_rand);    % D: Decrypted image, C: Cipher image, phase: phase image
B = im2bw(phase);                          % quantization <=0 -> 0 otherwise ->1
%% CS for host image
H = I; 
H = imresize(H, [m, n]);  
X_init = double(H);
%% DWT
X_dwt = full(W * sparse(X_init) * W');
X_dwt = im2col(X_dwt,[16, 16], 'distinct');
X_dwt = X_dwt';
%% CS
Y_H = T * X_dwt;
%% Quantization
[Y, Y_max, Y_min] = sigmoid( Y_H' );                     % s -> [0, 255]
Y = round(Y);
%% Encryption process
R = embed(B, Y, p);
P = permutation(R);
C = diffusion_func( P, D );
% sum_pixel = uint8(mod( sum(sum( I )), 256 ));
% C = bitxor( bitxor( uint8(P),  uint8(D) ), sum_pixel );
%% Attack
C_tamper = bitxor(C, tamp); % image tamper
C_noised = imnoise(C_tamper, 'salt & pepper', g); % image noising
C_noised(1:crop_m, 1:crop_n) = 0;
C_attack = C_noised;
%% Decryption process
% P_de = bitxor( bitxor( uint8(C),  uint8(D) ), sum_pixel );
P_de = de_diffusion(C_attack, D);
R_de = de_permutation(P_de);
[B_recover, Y_recover] = de_embed(R_de, p);
%% Phase recover
phase_recover = B_recover;
phase_recover(find(B_recover == 0)) = -pi;
phase_recover(find(B_recover == 1)) = pi;
%% Inverse DRPE
phase_de = DRPE_inverse(phase_recover, A_rand, B_rand); 
%% Inverse quantization
Y_H_recover = reverse_sigmoid(Y_recover, Y_max, Y_min); %  [0, 255] -> s
Y_H_recover = Y_H_recover';
%% Recover CS of host image
X = CS_recover(Y_H_recover, d, repeats, T);
% X = cvx_recover(Y_H_recover, d, repeats, T); % please startup first
%% Inverse DWT
X = X';
X = col2im(X, [16,16], [256,256], 'distinct');
X = full(W' * sparse(X) * W);
%% Non-cross relation
[CC, PCE] = cross_relation(phase_de, X);
%% PSNR & MSE
[psnr, mse] = psnr_mse(X, H);