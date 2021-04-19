% figure();
% imshow(uint8(C1), []);
% xlabel('Cipher image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% figure();
% imshow(uint8(abs(C1 - C0)), []);
% xlabel('Differential image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% sprintf('C1: %.4f', sum(reshape(double(C0) - double(C1), 1, []).^2)/65536)
% 
% figure();
% imshow(uint8(C2), []);
% xlabel('Cipher image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% figure();
% imshow(uint8(abs(C2 - C0)), []);
% xlabel('Differential image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% sprintf('C2: %.4f', sum(reshape(double(C0) - double(C2), 1, []).^2)/65536)
% 
% figure();
% imshow(uint8(C3), []);
% xlabel('Cipher image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% figure();
% imshow(uint8(abs(C3 - C0)), []);
% xlabel('Differential image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% sprintf('C3: %.4f', sum(reshape(double(C0) - double(C3), 1, []).^2)/65536)
% 
% figure();
% imshow(uint8(C4), []);
% xlabel('Cipher image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% figure();
% imshow(uint8(abs(C4 - C0)), []);
% xlabel('Differential image');
% set(gca, 'Position', [0 0 1 1] );
% set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
% set(gca, 'position', [ 0 0 1 1 ]);
% set(gcf, 'position', [ 100 100 400 400 ]);
% sprintf('C4: %.4f', sum(reshape(double(C0) - double(C4), 1, []).^2)/65536)



figure();
mesh(CC1, 'FaceColor', 'b', 'EdgeColor', 'g');   
axis([0 m 0 n 0 1]);
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 20);
set(gca,'Xticklabel',{''},'Yticklabel',{''});
set(gca, 'position', [ 0.12 0 0.87 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
figure();
imshow(uint8(phase_de1), []);
xlabel('Cipher image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
figure();
imshow(uint8(X1), []);
xlabel('Differential image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);



figure();
mesh(CC2, 'FaceColor', 'b', 'EdgeColor', 'g');   
axis([0 m 0 n 0 1]);
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 20);
set(gca,'Xticklabel',{''},'Yticklabel',{''});
set(gca, 'position', [ 0.12 0 0.87 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
figure();
imshow(uint8(phase_de2), []);
xlabel('Cipher image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
figure();
imshow(uint8(X2), []);
xlabel('Differential image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);

figure();
mesh(CC3, 'FaceColor', 'b', 'EdgeColor', 'g');   
axis([0 m 0 n 0 1]);
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 20);
set(gca,'Xticklabel',{''},'Yticklabel',{''});
set(gca, 'position', [ 0.12 0 0.87 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
figure();
imshow(uint8(phase_de3), []);
xlabel('Cipher image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
figure();
imshow(uint8(X3), []);
xlabel('Differential image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);

figure();
mesh(CC4, 'FaceColor', 'b', 'EdgeColor', 'g');   
axis([0 m 0 n 0 1]);
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 20);
set(gca,'Xticklabel',{''},'Yticklabel',{''});
set(gca, 'position', [ 0.12 0 0.87 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
figure();
imshow(uint8(phase_de4), []);
xlabel('Cipher image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);
figure();
imshow(uint8(X4), []);
xlabel('Differential image');
set(gca, 'Position', [0 0 1 1] );
set(gca, 'Fontname',  'Times New Roman', 'FontSize', 12);
set(gca, 'position', [ 0 0 1 1 ]);
set(gcf, 'position', [ 100 100 400 400 ]);