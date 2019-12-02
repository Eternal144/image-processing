function [new_img] = gauss(image)
% image=imread(origin);
[width,height,z]=size(image);
if(z>1)
    image=rgb2gray(image);
end
% figure(2);
% subplot(1,3,1);
% imshow(image);
% title('原图');
av=0;
std=0.1;
u1=rand(width,height);
u2=rand(width,height);
x=std*sqrt(-2*log(u1)).*cos(2*pi*u2)+av;
result1=double(image)/255+x;
result1=uint8(255*result1);
% subplot(1,3,2);
% imshow(result1);
% title('加高斯噪声后');
new_img=result1;

