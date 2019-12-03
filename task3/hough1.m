function [ Hough, theta_range, rho_range ] = hough1(I)
%NAIVEHOUGH Peforms the Hough transform in a straightforward way.
%
ff = imread('house.jpg');
I = rgb2gray(ff);
% I=edge(ff,'Canny',0.2);
% figure,
% imshow(I);
[rows, cols] = size(I);
theta_maximum = 90;
rho_maximum = floor(sqrt(rows^2 + cols^ 2)) - 1;
theta_range = -theta_maximum:theta_maximum - 1;
rho_range = -rho_maximum:rho_maximum;
 
Hough = zeros(length(rho_range), length(theta_range));
for row = 1:rows
    for col = 1:cols
        if I(row, col) > 0 %only find: pixel > 0
            x = col - 1;
            y = row - 1;
            for theta = theta_range
                rho = round((x * cosd(theta)) + (y * sind(theta)));  %approximate
                rho_index = rho + rho_maximum + 1;
                theta_index = theta + theta_maximum + 1;
                Hough(rho_index, theta_index) = Hough(rho_index, theta_index) + 1;
            end
        end
    end
end
figure,
% subplot(1,1,1);
imshow(Hough,[],'XData',theta_range,'YData',rho_range,'InitialMagnification','fit'),...
    title('转换后的霍夫空间')
xlabel('\theta'), ylabel('\rho');
axis on, axis normal;