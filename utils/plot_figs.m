function plot_figs(p, g, posibility, rate_crop)

load(['ans/omp-sampling-', num2str(p), '_noise-', num2str(g),...
        '_tamper-', num2str(posibility), '_crop-', num2str(rate_crop), '.mat']);
%% Cross-relation 
figure(1);
mesh(CC, 'FaceColor', 'b', 'EdgeColor', 'g');   
axis([0 m 0 n 0 1]);
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca,'Xticklabel',{''},'Yticklabel',{''});
% set(gcf, 'position', [ 100 100 400 400 ]);
xlabel('$x$', 'interpreter', 'latex');
ylabel('$y$', 'interpreter', 'latex');
zlabel('$z$', 'interpreter', 'latex');
%%
figure(2);
imshow(I, []);
xlabel('Input image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%%
figure(3);
imshow(Amp, []);
xlabel('Amplitude image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%%
figure(4);
imshow(phase_orignal, []);
xlabel('Phase image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%%
figure(5);
imshow(B, []);
xlabel('Binary image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%%
figure(6);
imshow(Y', []);
xlabel('Measured value');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%%
figure(7);
imshow(R', []);
xlabel('Embedded image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%%
figure(8);
imshow(C, []);
xlabel('Encrypted image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%%
figure(9);
imshow(X, []);
xlabel('Reconstructed image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%%
figure(10);
imshow(phase_de, []);
xlabel('Decrypted image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
%% 
figure(11);
imhist(uint8(I)); % Input
title('Input image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
figure(12);
imhist(uint8(C)); % Cipher
title('Encrypted image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
figure(13);
imhist(uint8(X)); % Reconstructed image
title('Reconstructed image');
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);

end