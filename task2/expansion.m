% �ú����������ǽ�һ����ά������չ�����ߣ����ҷ���
function [exp_img] = expansion(origin)
[height,width] = size(origin);
exp_img = zeros(height+2,width+2);
exp_img(2:height+1, 2:width+1) = origin;
% ��չ����
exp_img(1,2:width+1) = origin(1,:);
exp_img(2:height+1,1) = origin(:,1);
exp_img(2:height+1,width+2) = origin(:,width);
exp_img(height+2,2:width+1) = origin(height,:);
% ��չ�ĸ�����
exp_img(1,1) = origin(1,1);
exp_img(1,width+2) = origin(1,width);
exp_img(height+2,1) = origin(height,1);
exp_img(height+2,width+2) = origin(height,width);

