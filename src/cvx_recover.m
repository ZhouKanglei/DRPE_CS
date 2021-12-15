function [ X_cs ] = cvx_recover( Y, d, repeats, Phi)
%% CS reconstruction by cvx toolbox
    X_cs = zeros(d, repeats);

    h = waitbar(0, 'Please be paient to wait while CS reconstruction is underway...');
    cvx_startup;       % Configure  environment
    
    for i = 1 : repeats
        waitbar(i/repeats);
        s = Y(:, i);
        cvx_begin quiet
               variable x_cs(d);         
               minimize (norm(x_cs, 1));
               subject to 
                    Phi * x_cs == s;   
        cvx_end    
        X_cs(:, i) = x_cs;
    end

    close(h);
end

