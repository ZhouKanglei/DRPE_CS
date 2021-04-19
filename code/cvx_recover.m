function [ X_cs ] = cvx_recover( Y, d, repeats, Phi)
%% 
    X_cs = zeros(d, repeats);
    for i = 1 : repeats
        i
        s = Y(:, i);
        cvx_startup;                                                  % configuration  environment
        cvx_begin quiet
               variable x_cs(d);         
               minimize (norm(x_cs, 1));
               subject to 
                    Phi*x_cs == s;   
        cvx_end    
        X_cs(:, i) = x_cs;
    end
end

