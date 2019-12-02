function [new_img] = harmonic(noiseImg)
n=3;
[height,width] = size(noiseImg);
new_img = zeros(height,width);
exps_img = expansion(noiseImg);
img = double(exps_img);
img(img==0)=1;
for i = 1 : height
    for j = 1 : width
        s1 = img(i:i+n-1,j:j+n-1);
        s1 = 1./s1;
        s2 = sum(sum(s1));
        new_img(i,j) = numel(s1)/s2;
    end
end
new_img = uint8(new_img);
% subplot(1,3,3);
% imshow(new_img);
% title("Ð³²¨¾ùÖµÂË²¨Æ÷");
