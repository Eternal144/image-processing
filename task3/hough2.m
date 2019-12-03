img  = imread('house.jpg');
img_gray = rgb2gray(img);
figure,
subplot(2,2,1); imshow(img_gray); title('ԭͼ');
% the canny edge of image
BW = edge(img_gray,'canny');
subplot(2,2,2), imshow(BW), title('ͼ���Ե');

% the theta and rho of transformed space
[H,Theta,Rho] = hough(BW);
subplot(2,2,3), imshow(H,[],'XData',Theta,'YData',Rho,'InitialMagnification','fit'),...
    title('ת����Ļ���ռ�');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

% ѡ��ǰ5�����ཻ���ĵ㣨p[����]��theta)[����]��������ڻ���ռ��ϡ�
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
% ��theta����ת��Ϊ��Ӧmin-max�����ڵ�ֵ��
x = Theta(P(:,2)); 
% ��p����ת��Ϊ��Ӧmin-max�����ڵ�ֵ��-329 ?? 329
y = Rho(P(:,1));
plot(x,y,'*','color','r');

% ѡ������5�����ǵ�ֱ�ߣ�ѡ�������յ㡣5���ںϲ����ϲ���С��7������
lines = houghlines(BW,Theta,Rho,P,'FillGap',5,'MinLength',7);
subplot(2,2,4),imshow(BW),title('ֱ�߼��'), hold on
max_len = 0;
for k = 1:length(lines)
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','r');
end