function [ Y ] = CS(im, N, d, Phi, W)
    %% See https://github.com/talkbig/Detouring-Matching-Pursuit-Algorithm-in-Compressed-Sensing/blob/master/%E8%AE%BA%E6%96%87%E7%AE%97%E6%B3%95/OMP/OMP_DWT.m.
    X_init = double(im); % uint8 -> double
    X_dwt = full(W * sparse(X_init) * W'); % DWT for image in the matrix format (see https://ieeexplore.ieee.org/document/5553961).
    X_dwt = im2col(X_dwt, [sqrt(d), sqrt(d)], 'distinct'); % Rearrange image blocks into columns, ensuring each column originates from one block (16x16).
    X_dwt = X_dwt';
    Y = Phi * X_dwt; % CS: NxN -> Nxd
end