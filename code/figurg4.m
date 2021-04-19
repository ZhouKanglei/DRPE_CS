% subplot(1, 2, 1);
y = [];
x = [];
posibility = 0;
for i = 1:7
    p = i/8;
    load(['ans/tamper_', num2str(posibility), '_sampling_', num2str(p), '.mat']);
    y = [y psnr];
    x = [x p];
end
plot(x, y, '--bo',...
    'LineWidth', 1,'MarkerEdgeColor','w',...
    'MarkerFaceColor', 'b', 'MarkerSize',8);
hold on;
plot(x + 0.125, y, '--bs',...
    'LineWidth', 1,'MarkerEdgeColor','w',...
    'MarkerFaceColor', 'b', 'MarkerSize',8);

g = 0;
y = [];
x = [];
for i = 1:7
    p = i/8;
    load(['ans/omp_sampling_', num2str(p), '_noise_', num2str(g),'_tamper_', num2str(posibility),'.mat']);
    [psnr, mse] = psnr_mse(X, H);
    y = [y psnr];
    x = [x p];
end

plot(x, y, '--ro',...
    'LineWidth', 1,'MarkerEdgeColor','w',...
    'MarkerFaceColor', 'r', 'MarkerSize', 8);
hold on;
plot(x + 0.125, y, '--rs',...
    'LineWidth', 1,'MarkerEdgeColor','w',...
    'MarkerFaceColor', 'r', 'MarkerSize', 8);

legend('CVX', 'CVX+Authentication','OMP', 'OMP+Authentication ');
xlabel('Compression ratio of ciphertext image to original image');
ylabel('PSNR value of the reconstructed image');
set(gca, 'FontName', 'Times', 'FontSize', 14);

axis([0.05 1.05 18 45]);
grid on;



sum = 0;
for i = 1:6
    sum = sum + y(i+1)- y(i);
end
sum/7



hold off;
% subplot(1, 2, 2);
figure;
y = [];
x = [];
posibility = 0;
for i = 1:7
    p = i/8;
    load(['ans/omp_sampling_', num2str(p), '_noise_', num2str(g),'_tamper_', num2str(posibility),'.mat']);
    y = [y PCE];
    x = [x p];
end

plot(x, y, '--ko',...
    'LineWidth', 1,'MarkerEdgeColor','g',...
    'MarkerFaceColor', 'g', 'MarkerSize',8);
hold on;
% plot(x + 0.125, y, '--bs',...
%     'LineWidth', 1,'MarkerEdgeColor','w',...
%     'MarkerFaceColor', 'b', 'MarkerSize',8);

xlabel('Compression ratio of ciphertext image to original image');
ylabel('PCE value of the authentication result');
set(gca, 'FontName', 'Times', 'FontSize', 14);

axis([0.05 0.95 0.001 0.007]);
grid on;