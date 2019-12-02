origin = imread('lena.png');
subplot(3,3,1);
imshow(origin);
title("原图");

gaussp = salt_pepper(origin);
subplot(3,3,2);
imshow(gaussp);
title("添加椒噪声");

maxff = maxf(gaussp);
figure(1);
subplot(3,3,4);
imshow(maxff);
title("最大值滤波器");

minff = minf(gaussp);
figure(1);
subplot(3,3,5);
imshow(minff);
title("最小值滤波器");

minff = medf(gaussp);
figure(1);
subplot(3,3,6);
imshow(minff);
title("中点滤波器");

J = alpha(gaussp);
figure(1);
subplot(3,3,7);
imshow(J);
title("修正后的阿尔法均值滤波器");

KK = im2double(gaussp);
M = adaptive(KK,[5 5]);
figure(1);
subplot(3,3,8);
imshow(M);
title("自适应滤波器");

har = adp_median(gaussp,19);
figure(1);
subplot(3,3,9);
imshow(har);
title("自适中值滤波器");

% J = adp_median(gaussp,19);
% figure(1);
% subplot(3,3,9);
% imshow(J);
% title("自适应中值滤波器");

% figure(1);
% origin1 = origin;
% subplot(2,3,4);
% imshow(origin1);
% title("原图");
% 
% figure(1);
% salt_p = salt_pepper(origin);
% subplot(2,3,5);
% imshow(salt_p);
% title("添加椒盐噪声");
% 
% ff2 = adp_median(salt_p,19);
% figure(1);
% subplot(2,3,6);
% imshow(ff2);
% title("自适应中值滤波器");

