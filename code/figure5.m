clear;clc;
y1 = [];
x1 = [];
posibility = 0;
p = 0.875;
g1 = 0;
for i = 1:7
    p = i / 8;
    load(['ans/omp_sampling_', num2str(p), '_noise_', num2str(g1),'_tamper_', num2str(posibility),'.mat']);
    mesh(CC);
    y1 = [y1 PCE];
    x1 = [x1 p];
end

plot(x1, y1, '--ko',...
    'LineWidth', 1,'MarkerEdgeColor','g',...
    'MarkerFaceColor', 'g', 'MarkerSize',8);
hold on;

% plot(x + 0.125, y, '--bs',...
%     'LineWidth', 1,'MarkerEdgeColor','w',...
%     'MarkerFaceColor', 'b', 'MarkerSize',8);

xlabel('Compression ratio');
ylabel('PCE');
set(gca, 'FontName', 'Times', 'FontSize', 12);

% axis([0.05 0.95 0.001 0.007]);
grid on;
