function [ hat_x ] = OMP( s, T )
%% 
    [N, d] = size( T );
    hat_y = zeros(1, d);  % OMP algorithm
    Aug_t = [];
    aug_y = [];
    pos_array = [];
    r_n = s;
    times = 1;
%%   
    while 1
%     	times
        for col = 1:d
            product(col) = abs(T(:,col)'*r_n);
        end
        [val, pos] = max(product);
        Aug_t = [Aug_t, T(:, pos)];
        T(:, pos) = zeros(N, 1);
        aug_y = pinv(Aug_t'*Aug_t)*Aug_t'*s;

        r_n = s - Aug_t*aug_y;
        pos_array(times) = pos;
        times = times + 1;
   
        if norm(r_n) <  0.01 | times >= d
            break;
        end    
    end
%%
    hat_y(pos_array) = aug_y;
    hat_x = hat_y;
end