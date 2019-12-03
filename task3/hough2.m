img  = imread('house.jpg');
img_gray = rgb2gray(img);
figure,
subplot(2,2,1); imshow(img_gray); title('原图');
% the canny edge of image
BW = edge(img_gray,'canny');
subplot(2,2,2), imshow(BW), title('图像边缘');

% the theta and rho of transformed space
[H,Theta,Rho] = hough(BW);
subplot(2,2,3), imshow(H,[],'XData',Theta,'YData',Rho,'InitialMagnification','fit'),...
    title('转换后的霍夫空间');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

% 选出前5个线相交最多的点（p[格子]，theta)[格子]，并标记在霍夫空间上。
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
% 将theta格子转化为对应min-max区间内的值。
x = Theta(P(:,2)); 
% 将p格子转化为对应min-max区间内的值。-329 ?? 329
y = Rho(P(:,1));
plot(x,y,'*','color','r');

% 选出与这5个点标记的直线，选出起点和终点。5以内合并，合并后小于7则丢弃。
lines = houghlines(BW,Theta,Rho,P,'FillGap',5,'MinLength',7);
subplot(2,2,4),imshow(BW),title('直线检测'), hold on
max_len = 0;
for k = 1:length(lines)
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','r');
end