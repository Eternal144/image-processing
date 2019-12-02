function [new_img] = salt_pepper(image)
% image=imread(origin);
[width,height,z]=size(image);
if(z>1)
    image=rgb2gray(image);
end
result2=image;
% figure(2);
% subplot(1,2,1);
% imshow(image);
% title('原图');
k1=0.1;
k2=0.3;
a1=rand(width,height)<k1;
a2=rand(width,height)<k2;
result2(a1&a2)=0;
% result2(a1& ~a2)=255;
% subplot(1,2,2);
% imshow(result2);
% title('加椒盐噪声之后');
new_img=result2;
