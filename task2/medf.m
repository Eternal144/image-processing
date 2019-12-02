function [new_img] = medf(noiseImg)
n = 3;
[height, width] = size(noiseImg);
new_img = zeros(height,width);
exps_img = expansion(noiseImg);
img = double(exps_img);
for i = 1 : height
    for j = 1 : width
        window = img(i:i+n-1,j:j+n-1);
        linear = window(:);
        max_v = max(linear);
        min_v = min(linear);
        new_img(i,j) = (max_v+min_v)/2;
    end
end
new_img = uint8(new_img);