posibility = 0;% Ratio of tamper
g = 0;         % Ratio of noisy param
rate_crop = 0; % Ratio of cropping
% for i = 1 : 5
%     disp('---------------------------------');
%     test;
%     ans_name = ['ans/omp_sampling_', num2str(p), '_noise_', num2str(g),'_tamper_', num2str(posibility),'.mat'];
%     save(ans_name);
%     disp(['Save answer to ', ans_name]);
%     g = g + 0.002;
% end


for i = 1 : 7
    disp('---------------------------------');
    p = i/8;
    test;
    ans_name = ['ans/omp_sampling_', num2str(p), '_noise_', num2str(g),'_tamper_', num2str(posibility),'.mat'];
    save(ans_name);
    disp(['Save answer to ', ans_name]);
end
