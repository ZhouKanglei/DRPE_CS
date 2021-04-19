function [ H ] = MHM(b1, b2, x0, y0, m_len, n_len)
%% function: Henon map
    X(1,1) = x0;
    Y(1,1) = y0; 
    for i = 2 : m_len * n_len
        X(1, i) = 1 - b1 * X(1, i - 1) * X(1, i - 1)  + Y(1, i - 1);
        Y(1, i) = b2 * X(1, i - 1);
    end
    [XX, X_index] = sort( X );
    [YY, Y_index] = sort( Y );
    plot(X,Y);
    H = reshape(X_index, m_len, n_len );
end