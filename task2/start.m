I = imread('../lena.png');
% I = rgb2gray(RGB);
% % I = I(601:1000,1:600);

% J = imnoise(I,'gaussian',0,0.005);
% M = salt_pepper(I);
% 
% J = im2double(J);
% M = im2double(M);
% 
% K = adaptive(J,[5 5]);
% O = adaptive(M,[5,5]);
% figure;
% subplot(2,3,1),imshow(I), title('ԭͼ');
% subplot(2,3,2), imshow(J), title('��Ӹ�˹����');
% subplot(2,3,3), imshow(K), title('����Ӧ�˲���');
% subplot(2,3,4),imshow(I), title('ԭͼ');
% subplot(2,3,5),imshow(M), title('��ӽ�������');
% subplot(2,3,6),imshow(O), title('����Ӧ�˲���');
% % ��ֵ��Ч��������
J = salt_pepper(I);
ff = adp_median(J,19);
% I = I(601:1000,1:600);
% J = double(J);
% ff = adaptive(J,[5 5])
figure;
subplot(1,3,3);
imshow(ff);
title('denoised image');

