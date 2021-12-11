function [ X_cs ] = CS_recover( Y, d, repeats, Phi)
    X_cs = zeros(d, repeats);
    h = waitbar(0, 'Please wait while CS reconstruction is underway...');
    for t = 1 : repeats
        waitbar(t/repeats);
        x_cs = OMP1(Y(:, t), Phi);
        X_cs(:, t) = x_cs;
    end
    close(h);
end

