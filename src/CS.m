function [ Y ] = CS(im, N, d, Phi, W)
    X_init = double(im);
    X_dwt = full(W * sparse(X_init) * W');
    X_dwt = im2col(X_dwt, [sqrt(d), sqrt(d)], 'distinct');
    X_dwt = X_dwt';
    Y = Phi * X_dwt;
end