clear;clc;
m = 256;
n = 256;
x0 = 0.3;
y0 = 0.4;
alpha = 1.4;
beta = 0.3;
% key = MHM( alpha, beta, x0, y0, m, n);
% for i = 1:m
%     for j = 1:n
%         P1(i, j) = mod(key(i, j), m);
%         if P1(i, j) == 0
%             P1(i, j) = m;
%         end
%         P2(i, j) = ceil(key(i, j)/m);
%     end
% end
% save(['key_', num2str(m), '_', num2str(n), '.mat'], 'key', 'P1', 'P2');

m = 256;
n = 256;
alpha = 1.30;
beta = 0.25;
key = MHM( alpha, beta, x0, y0, m, n);
D = mod(key, 256);

save(['D_', num2str(m), '_', num2str(n), '.mat'], 'key', 'D', '-append');