%% Initial parameters
m = 256;    % size of input image
n = 256;    % size of input image

if exist('g', 'var') == 0
    p = 15/16;    % rate of sampling
end

m_cipher = m;
n_cipher = round(n * p) + round(n * 1/8);

d = m;		                    % length of signal
N = round(d * p);               % the quantity of measured values
repeats = n;                    % recover times for CS

%% Load keys
key_dir = './keys';
if ~exist(key_dir, 'dir') == 1
   mkdir(key_dir); % create key dir
end

ans_dir = './ans';
if ~exist(ans_dir, 'dir') == 1
   mkdir(ans_dir); % create ans dir
end

A_rand_path = [key_dir, '/A_rand-', num2str(m), '_', num2str(n), '.mat'];
if ~exist(A_rand_path,'file') == 1
    A_rand = rand(m, n);           
    save(A_rand_path, 'A_rand');
    disp(['Generate and save the key to ', A_rand_path]);
end
load(A_rand_path, 'A_rand');  % mask 1 for DRPE

B_rand_path = [key_dir, '/B_rand-', num2str(m), '_', num2str(n), '.mat'];
if ~exist(B_rand_path,'file') == 1
    B_rand = rand(m, n);           
    save(B_rand_path, 'B_rand');
    disp(['Generate and save the key to ', B_rand_path]);
end
load(B_rand_path, 'B_rand');    % mask 2 for DRPE

D_path = [key_dir, '/D_', num2str(m_cipher), '_', num2str(n_cipher), '.mat'];
if ~exist(D_path,'file') == 1
    x0 = 0.3;
    y0 = 0.4;
    alpha = 1.30;
    beta = 0.25;
    key = MHM( alpha, beta, x0, y0, m_cipher, n_cipher);
    D = mod(key, 256);
    save(D_path, 'D');
    disp(['Generate and save the key to ', D_path]);
end
load(D_path, 'D');  % Diffusion matrix

P_path = [key_dir, '/key_', num2str(m_cipher), '_', num2str(n_cipher), '.mat'];
if ~exist(P_path, 'file')
    x0 = 0.3;
    y0 = 0.4;
    alpha = 1.4;
    beta = 0.3;
    key = MHM(alpha, beta, x0, y0, m_cipher, n_cipher);
    for i = 1:m_cipher
        for j = 1:n_cipher
            P1(i, j) = mod(key(i, j), m_cipher);
            if P1(i, j) == 0
                P1(i, j) = m_cipher;
            end
            P2(i, j) = ceil(key(i, j) / m_cipher);
        end
    end
    save(P_path, 'key', 'P1', 'P2'); % permutation key
    disp(['Generate and save the key to ', P_path]);
end
load(P_path);

Phi_path = [key_dir, '/Phi_', num2str(N), '_', num2str(d), '.mat'];
if ~exist(Phi_path,'file') == 1
    Phi = randn(N, d); 
    save(Phi_path, 'Phi');
    disp(['Generate and save the key to ', Phi_path]);
end
load(Phi_path, 'Phi');  % Gaussian random matrix
A = dctmtx(d);	        % DCT matrix
T = Phi * inv(A);       % sense matrix
W = DWT(d);             % DWT matrix

%% Attack params
if exist('posibility', 'var') == 0
    posibility = 0; % tamper with the scale of pixels
end
tamp = randsample([0 1], m * ceil(n * (p + 1/8)), true, [1 - posibility posibility]);
tamp = reshape(tamp, m, ceil(n * (p + 1/8)));
tamp = tamp .* floor(rand(m, ceil(n * (p + 1/8))) * 255);
tamp = uint8(tamp);

if exist('g', 'var') == 0
    g = 0; % ratio of adding noise
end

if exist('rate_crop', 'var') == 0
    rate_crop = 0;
end
crop_m = ceil(m_cipher * sqrt(rate_crop));
crop_n = ceil(n_cipher * sqrt(rate_crop));

%% Henon map for generating keys
function [ H ] = MHM(b1, b2, x0, y0, m_len, n_len)
    X(1,1) = x0;
    Y(1,1) = y0; 
    for i = 2 : m_len * n_len
        X(1, i) = 1 - b1 * X(1, i - 1) * X(1, i - 1)  + Y(1, i - 1);
        Y(1, i) = b2 * X(1, i - 1);
    end
    [XX, X_index] = sort( X );
    [YY, Y_index] = sort( Y );
    H = reshape(X_index, m_len, n_len );
end