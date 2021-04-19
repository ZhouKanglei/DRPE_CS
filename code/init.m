%% Initial parameters
m = 256;  % size of input image
n = 256;   % size of input image
p = 7/8;    % rate o f sampling
load('keys/p.mat');

load(['keys/A_rand_', num2str(m)]); % Mask 1 for DRPE
load(['keys/B_rand_', num2str(m)]);  % Mask 2 for DRPE

load(['keys/D_', num2str(m), '_', num2str(n),]);  % Diffusion matrix

d = m;		                         % the length of signal
N = round(d*p);               % the quantity of measured values
A = dctmtx(d);	                % DCT matrix

Phi_1 = randn(N, d);            % Gaussian random matrix
% save(['keys/Phi_', num2str(N), '_', num2str(d), '.mat'], 'Phi');
load(['keys/Phi_', num2str(N), '_', num2str(d), '.mat'], 'Phi');
% Phi = randn(N, d);            % Gaussian random matrix

T = Phi*inv(A);                  % sense matrix

repeats = n;                       % Recover times
W = DWT(d);                     % DWT

posibility = 0;
load('keys/tamp.mat', 'posibility');
tamp = randsample([0 1], m*ceil(n*(p+1/8)), true, [1 - posibility posibility]);
tamp = reshape(tamp, m, ceil(n*(p+1/8)));
tamp = tamp.*floor(rand(m, ceil(n*(p+1/8)))*255);
tamp = uint8(tamp);

g = 0;
load('keys/g.mat', 'g');