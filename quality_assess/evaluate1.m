function [PSNRvector] = evaluate1(imagery1,imagery2)

[m, n, k] = size(imagery1);
[mm, nn, kk] = size(imagery2);
m = min(m, mm);
n = min(n, nn);
k = min(k, kk);
imagery1 = imagery1(1:m, 1:n, 1:k);
imagery2 = imagery2(1:m, 1:n, 1:k);

PSNRvector=zeros(1,k);
psnr = 0;
ssim = 0;
fsim = 0;
for i = 1:k
    
    
    PSNRvector(1,i)=10*log10(255^2/mse(imagery1(:, :, i) - imagery2(:, :, i)));
end

