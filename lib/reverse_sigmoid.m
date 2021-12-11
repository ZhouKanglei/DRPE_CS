function [ s ] = reverse_sigmoid( l, s_max, s_min)
%% Reverrse the sigmoid phase.
    a1 = 255;
    a2 = 80./(15.518.*(s_max - s_min));
    a3 = (s_min + s_max)/2;
%%    
    [m, n] = size(l);
    for i = 1:m
        for j = 1:n
            if l(i, j) == 0
                l(i, j) = 1;
            end
            
            if l(i, j) ~= 0
                
                if l(i, j) == 255
                    l(i, j) = 254;
                end
                
                if sum(size(s_min)) == 2
                    s(i, j) = log(a1/l(i, j) - 1)/(-a2) + a3;
                else
                    s(i, j) = log(a1/l(i, j) - 1)/(-a2(j)) + a3(j);
                end
                
            else
                s(i, j) = 0;
            end
            

            
            
        end
    end
end

