function plot_pce(p, g, posibility, rate_crop)
y1 = [];
x1 = [];

for i = 1:7
    p = i / 8;
    load(['ans/omp-sampling-', num2str(p), '_noise-', num2str(g),...
            '_tamper-', num2str(posibility), '_crop-', num2str(rate_crop), '.mat']);
    y1 = [y1 PCE];
    x1 = [x1 p];
end

plot(x1, y1, '--ko',...
    'LineWidth', 1,'MarkerEdgeColor','g',...
    'MarkerFaceColor', 'g', 'MarkerSize',8);
hold on;

xlabel('Compression ratio');
ylabel('PCE');
set(gca, 'FontName', 'Times', 'FontSize', 12);
grid on;
end
