function [new_img] = medianf(noiseImg)
n = 3;
[height, width] = size(noiseImg);
new_img = zeros(height,width);
exps_img = expansion(noiseImg);
img = double(exps_img);
for i = 1 : height
    for j = 1 : width
        window = img(i:i+n-1,j:j+n-1);
        linear = window(:);
        mid = median(linear);
        new_img(i,j) = mid;
    end
end
new_img = uint8(new_img);
% subplot(1,3,3);
% imshow(new_img);
% title("ÖÐÖµÂË²¨Æ÷")


