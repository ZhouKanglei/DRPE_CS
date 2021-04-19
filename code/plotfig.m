p = 0.875;
g = 0;
posibility = 0;
load(['ans/error5_omp_sampling_', num2str(p), '_noise_', num2str(g),'_tamper_', num2str(posibility),'.mat']);
%% Cross-relation 
figure(1);
mesh(CC, 'FaceColor', 'b', 'EdgeColor', 'g');   
axis([0 m 0 n 0 1]);
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 20);
set(gca,'Xticklabel',{''},'Yticklabel',{''});
set(gca, 'position', [ 0.12 0 0.87 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
% 
% xlabel('x');
% ylabel('y');
% zlabel('z');
%%
% figure(2);
% imshow(I, []);
% xlabel('Input image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% %%
% figure(3);
% imshow(Amp, []);
% xlabel('Amplitude image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% %%
% figure(4);
% imshow(phase, []);
% xlabel('Phase image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% %%
% figure(5);
% imshow(B, []);
% xlabel('Binary image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% %%
% figure();
% imshow(Y', []);
% xlabel('Measured value');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% %%
% figure();
% imshow(R', []);
% xlabel('Embedded image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% %%
% figure();
% imshow(C, []);
% % xlabel('Encrypted image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
%%
%%
figure();
imshow(X, []);
xlabel('Reconstructed image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
% %%
figure();
imshow(phase_de, []);
xlabel('Decrypted image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);


% imhist(uint8(I))
% figure;
% imhist(uint8(C))
% figure;
% imhist(uint8(X))
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 14);