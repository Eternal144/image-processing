function [new_img] = alpha(noiseImg)
n = 3;
[height,width] = size(noiseImg);
new_img = zeros(height,width);
exp_img = expansion(noiseImg);
img = double(exp_img);
img(img==0)=1;
for i = 1 : height
    for j = 1 : width
        s1 = img(i:i+n-1, j:j+n-1);
        max_v = max(s1(:));
        min_v = min(s1(:));
        s1(s1==max_v)=0;
        s1(s1==min_v)=0;
        s2 = sum(sum(s1));
        new_img(i,j) = s2/(n*n-2);
    end
end
new_img = uint8(new_img);
% subplot(1,3,3);
% imshow(new_img);
% title("修正后的阿尔法均值滤波器");
