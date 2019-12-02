function [new_img] = average(noiseImg)
n = 3;
% ��ֵ��ߴ��ԭ��һֱ
[height,width] = size(noiseImg);
new_img = zeros(height,width);
% ��չ���ͼ��
exps_img = expansion(noiseImg);
window = ones(n);
img = double(exps_img);
for i = 1 : height
    for j = 1 : width
        s1 = img(i:i+n-1,j:j+n-1).*window;
        s2 = sum(sum(s1));
        new_img(i,j) = s2/(n*n);
    end
end
new_img = uint8(new_img);
% subplot(1,3,3);
% imshow(new_img);
% title('������ֵ�˲���');


