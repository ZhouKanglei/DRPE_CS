%% Iterate the answer directory.
fileFolder = fullfile('./ans');
dirOutput = dir(fullfile(fileFolder, '*.mat'));
fileNames = {dirOutput.name};

fprintf('----------------------------------\n');
omp_sampling_rate = [];
omp_psnr_val = [];
omp_pce_val = [];

cvx_sampling_rate = [];
cvx_psnr_val = [];
cvx_pce_val = [];
for i_num = 1 : size(fileNames, 2)
    fullFilename = char(fileNames(i_num));
    filename = strrep(fullFilename, '.mat', '');
    load(['./ans/', fullFilename]);
    
    fprintf('%3d & %-45s & %.4f & %.4f & %.4f & %.4f & %.4f & %.4f \\\\\n',...
        i_num, filename, p, g, posibility, rate_crop, psnr, PCE);
    
    if strfind(method, 'omp')
        omp_sampling_rate = [omp_sampling_rate p];
        omp_psnr_val = [omp_psnr_val psnr];
        omp_pce_val = [omp_pce_val PCE];
    else if strfind(method, 'cvx')
            cvx_sampling_rate = [cvx_sampling_rate p];
            cvx_psnr_val = [cvx_psnr_val psnr];
            cvx_pce_val = [cvx_pce_val PCE];
        end
    end
end
fprintf('----------------------------------\n');

%% Plot the psnr curve w.r.t. the sampling ratio
figure();

plot(omp_sampling_rate, omp_psnr_val, '--bo',...
    'LineWidth', 1, 'MarkerEdgeColor','w',...
    'MarkerFaceColor', 'b', 'MarkerSize',8);
hold on;
plot(omp_sampling_rate + 0.125, omp_psnr_val, '--bs',...
    'LineWidth', 1, 'MarkerEdgeColor','w',...
    'MarkerFaceColor', 'b', 'MarkerSize',8);

plot(cvx_sampling_rate, cvx_psnr_val, '--ro',...
    'LineWidth', 1, 'MarkerEdgeColor','w',...
    'MarkerFaceColor', 'r', 'MarkerSize', 8);
hold on;
plot(cvx_sampling_rate + 0.125, cvx_psnr_val, '--rs',...
    'LineWidth', 1, 'MarkerEdgeColor','w',...
    'MarkerFaceColor', 'r', 'MarkerSize', 8);

legend('OMP', 'OMP+Authentication ', 'CVX', 'CVX+Authentication');
xlabel('Compression ratio of ciphertext image to original image');
ylabel('PSNR value of the reconstructed image');
set(gca, 'FontName', 'Times', 'FontSize', 14);

axis([0.05 1.05 18 45]);
grid on;
hold off;

%% Plot the PCE curve w.r.t. the sampling ratio
figure;
plot(omp_sampling_rate, omp_pce_val, '--ko',...
    'LineWidth', 1, 'MarkerEdgeColor','k',...
    'MarkerFaceColor', 'g', 'MarkerSize',8);

xlabel('Compression ratio of ciphertext image to original image');
ylabel('PCE value of the authentication result');
set(gca, 'FontName', 'Times', 'FontSize', 14);

axis([0.05 0.95 0.001 0.007]);
grid on;