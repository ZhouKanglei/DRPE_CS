function [ l, s_max, s_min ] = sigmoid( s )
%% Please see Ref. �޽���, ������, �Ų�, et al. һ�ֻ���ѹ����֪������ͼ��������㷨[J]. ������ҵ��ѧѧ��, 2014, 26(1).
    [m, n] = size(s);
    s_min = min(s);
    s_max = max(s);
%%   
    a1 = 255;
    a2 = 80./(15.518.*(s_max - s_min));
    a3 = (s_min + s_max)/2;
 %%  
    for i = 1:m
        for j = 1:n
            
            if sum(size(s_min)) == 2
                l(i, j) = a1/(1 + exp(-a2*(s(i, j) - a3)));
            else
                l(i, j) = a1/(1 + exp(-a2(j)*(s(i, j) - a3(j))));
            end
            
        end
    end
    
end

