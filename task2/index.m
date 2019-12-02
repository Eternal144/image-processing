origin = imread('lena.png');
subplot(3,3,1);
imshow(origin);
title("ԭͼ");

gaussp = salt_pepper(origin);
subplot(3,3,2);
imshow(gaussp);
title("��ӽ�����");

maxff = maxf(gaussp);
figure(1);
subplot(3,3,4);
imshow(maxff);
title("���ֵ�˲���");

minff = minf(gaussp);
figure(1);
subplot(3,3,5);
imshow(minff);
title("��Сֵ�˲���");

minff = medf(gaussp);
figure(1);
subplot(3,3,6);
imshow(minff);
title("�е��˲���");

J = alpha(gaussp);
figure(1);
subplot(3,3,7);
imshow(J);
title("������İ�������ֵ�˲���");

KK = im2double(gaussp);
M = adaptive(KK,[5 5]);
figure(1);
subplot(3,3,8);
imshow(M);
title("����Ӧ�˲���");

har = adp_median(gaussp,19);
figure(1);
subplot(3,3,9);
imshow(har);
title("������ֵ�˲���");

% J = adp_median(gaussp,19);
% figure(1);
% subplot(3,3,9);
% imshow(J);
% title("����Ӧ��ֵ�˲���");

% figure(1);
% origin1 = origin;
% subplot(2,3,4);
% imshow(origin1);
% title("ԭͼ");
% 
% figure(1);
% salt_p = salt_pepper(origin);
% subplot(2,3,5);
% imshow(salt_p);
% title("��ӽ�������");
% 
% ff2 = adp_median(salt_p,19);
% figure(1);
% subplot(2,3,6);
% imshow(ff2);
% title("����Ӧ��ֵ�˲���");

