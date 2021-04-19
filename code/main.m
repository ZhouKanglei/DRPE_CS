posibility = 0;
g = 0.04;
p = 0.875;
for i = 1:40
%     posibility = posibility + 0.005;
%     p = i/8;
    g = g + 0.002;
    save('keys/tamp.mat', 'posibility');
    save('keys/g.mat', 'g');
    save('keys/p.mat', 'p');
    test;
    save(['ans/omp_sampling_', num2str(p), '_noise_', num2str(g),'_tamper_', num2str(posibility),'.mat']);
end
