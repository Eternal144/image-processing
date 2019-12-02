function [new_img] = average(noiseImg)
n = 3;
% 插值后尺寸和原来一直
[height,width] = size(noiseImg);
new_img = zeros(height,width);
% 扩展后的图像
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
% title('算术均值滤波器');


