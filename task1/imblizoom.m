% ����
% origin:Ϊԭʼͼ���ļ���
% scale:���ŵı���
% ���
% new_img:����˫���Բ�ֵ�õ�����ͼ�� 
function [new_img] = imblizoom(origin,scale)
origin = imread(origin);
[height,width,channel] = size(origin);
new_height = round(height*scale);
new_width = round(width*scale);
new_img = zeros(new_height,new_width,channel);
% ���ǵ��߽��,��imblizoomչԭ�����Ե
img_scale = zeros(height+2, width+2,channel);
img_scale(2:height+1,2:width+1,:) = origin;
% Ϊ��չ�����ĸ��߸�ֵ
% ��չ�����ĵ�һ��Ϊԭ����һ�е�ֵ
img_scale(1,2:width+1,:) = origin(1,:,:);
% ���һ��
img_scale(height+2,2:width+1,:) = origin(height,:,:);
% ��һ��
img_scale(2:height+1,1,:) = origin(:,1,:);
% ���һ��
img_scale(2:height+1,width+2,:) = origin(:,width,:);
% �ĸ�����
img_scale(1,1,:) = origin(1,1,:);
img_scale(1,width+2,:) = origin(1,width,:);
img_scale(height+2,1,:) = origin(height,1,:);
img_scale(height+2,width+2,:) = origin(height,width,:);
% ����˫���Բ�ֵ
for i = 1:new_height
    for j = 1:new_width
%(i,j)Ϊԭͼ�е����꣬(oi,oj)Ϊӳ�䵽ԭͼ�е����꣬int_i,int_jΪoi��ojȡ��ֵ
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
title(['���ű���Ϊ',num2str(scale),'��ͼ'])
figure,imshow(origin);
title("ԭͼ");
end


