function [ X_cs ] = CS_recover( Y, d, repeats, Phi)
%% 
    X_cs = zeros(d, repeats);
    for t = 1 : repeats
        t
        x_cs = OMP1(Y(:, t), Phi);
        X_cs(:, t) = x_cs;
    end
end

