
function [newGrayPic]= edge1()
sourcePic=imread('house.jpg');
sourcePic = rgb2gray(sourcePic);
grayPic=mat2gray(sourcePic);
[m,n]=size(grayPic);
newGrayPic=grayPic;
PrewittNum=0;
PrewittThreshold=0.9;%�趨��ֵ
for j=2:m-1 %���б߽���ȡ
    for k=2:n-1
        PrewittNum=abs(grayPic(j-1,k+1)-grayPic(j+1,k+1)+grayPic(j-1,k)-grayPic(j+1,k)+grayPic(j-1,k-1)-grayPic(j+1,k-1))+abs(grayPic(j-1,k+1)+grayPic(j,k+1)+grayPic(j+1,k+1)-grayPic(j-1,k-1)-grayPic(j,k-1)-grayPic(j+1,k-1));
        if(PrewittNum > PrewittThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
figure,
subplot(1,2,1);
imshow(sourcePic);
title('ԭͼ');
subplot(1,2,2);
imshow(newGrayPic);
title('Prewitt���ӵĴ�����')