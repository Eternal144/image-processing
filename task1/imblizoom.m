% 输入
% origin:为原始图像文件名
% scale:缩放的比例
% 输出
% new_img:经过双线性插值得到的新图像 
function [new_img] = imblizoom(origin,scale)
origin = imread(origin);
[height,width,channel] = size(origin);
new_height = round(height*scale);
new_width = round(width*scale);
new_img = zeros(new_height,new_width,channel);
% 考虑到边界点,扩imblizoom展原矩阵边缘
img_scale = zeros(height+2, width+2,channel);
img_scale(2:height+1,2:width+1,:) = origin;
% 为扩展而来的各边赋值
% 扩展而来的第一行为原来第一行的值
img_scale(1,2:width+1,:) = origin(1,:,:);
% 最后一行
img_scale(height+2,2:width+1,:) = origin(height,:,:);
% 第一列
img_scale(2:height+1,1,:) = origin(:,1,:);
% 最后一列
img_scale(2:height+1,width+2,:) = origin(:,width,:);
% 四个顶点
img_scale(1,1,:) = origin(1,1,:);
img_scale(1,width+2,:) = origin(1,width,:);
img_scale(height+2,1,:) = origin(height,1,:);
img_scale(height+2,width+2,:) = origin(height,width,:);
% 进行双线性插值
for i = 1:new_height
    for j = 1:new_width
%(i,j)为原图中的坐标，(oi,oj)为映射到原图中的坐标，int_i,int_j为oi，oj取整值
        oi = (i-1)/scale;
        oj = (j-1)/scale;
        int_i = floor(oi);
        int_j = floor(oj);
        dec_i = oi-int_i;
        dec_j = oj-int_j;
        int_i = int_i+1;
        int_j = int_j+1;
        new_img(i,j,:) = (1-dec_i)*(1-dec_j)*img_scale(int_i,int_j,:)+...
        dec_i*(1-dec_j)*img_scale(int_i,int_j+1,:)+(1-dec_i)*dec_j*img_scale(int_i+1,int_j,:)+dec_i...
        *dec_j*img_scale(int_i+1,int_j+1,:);
    end
end
new_img = uint8(new_img);
figure,imshow(new_img);
title(['缩放比例为',num2str(scale),'的图'])
figure,imshow(origin);
title("原图");
end


