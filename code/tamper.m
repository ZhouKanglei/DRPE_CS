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
Y_H = CS(H, bm, bn, N, d, Phi, A, T);
[Y, Y_max, Y_min] = sigmoid( Y_H' );          % s -> [0, 255]
Y = round(Y);
%% Encryption process
R = embed(B, Y, p);
C = permutation(R);

% tamp = randsample([0 1],65536, true, [0.8 0.2]);
% tamp = reshape(tamp, 256, 256);
% tamp = tamp*ceil(rand(1)*255);
load('tamp.mat', 'tamp');
C = bitxor(C, tamp);

%% Decryption process
R_de = de_permutation(C);
[B_recover, Y_recover] = de_embed(R_de, p);

phase_recover = B_recover;
phase_recover(find(B_recover == 0)) = -pi;
phase_recover(find(B_recover == 1)) = pi;

Y_H_recover = reverse_sigmoid(Y_recover, Y_max, Y_min); %  [0, 255] -> s
Y_H_recover = Y_H_recover';
%% Recover CS of host image
X = cvx_recover( Y_H, m, n, bm, bn, d, N, Phi, A, T);
D = DRPE_inverse(phase_recover, A_rand, B_rand); 
[CC, PCE] = cross_relation(D, X);
[psnr, mse] = psnr_mse(X, H);

% save(['ans/0.25Lena_', num2str(p), '.mat']);