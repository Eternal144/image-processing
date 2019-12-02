function [new_img] = in_harmonic(noiseImg,Q)
n=3;
[height,width] = size(noiseImg);
new_img = zeros(height,width);
exps_img = expansion(noiseImg);
img = double(exps_img);
img(img==0)=1;
for i = 1 : height
    for j = 1 : width
        s1 = img(i:i+n-1, j:j+n-1);
        q1 = s1.^(Q+1);
        sq1 = sum(sum(q1));
        q = s1.^Q;
        sq = sum(sum(q));
        new_img(i,j) = sq1/sq;
    end
end
new_img = uint8(new_img);
% subplot(1,3,3);
% imshow(new_img);
% title("ÄæÐ³²¨¾ùÖµÂË²¨Æ÷")
