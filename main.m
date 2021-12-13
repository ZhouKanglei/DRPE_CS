clc; close all; clear;
addpath(genpath('utils/'));
addpath(genpath('lib/'));

%% Loop
posibility = 0;% Ratio of tamper
g = 0;         % Ratio of noisy param
rate_crop = 0; % Ratio of cropping
p = 7 / 8;     % Ratio of sampling
method = 'omp';% If method is set to cvx, then please wati for a long time.

for i = 1 : 15
    disp('---------------------------------');
    p = i / 16;
    test;
    ans_name = ['ans/', method, '_sampling-', num2str(p), '_noise-', num2str(g),...
        '_tamper-', num2str(posibility), '_crop-', num2str(rate_crop), '.mat'];
    save(ans_name);
    disp(['Save answer to ', ans_name]);
end

%% Visualization
plot_figs(method, p, g, posibility, rate_crop);
plot_pce_psnr();