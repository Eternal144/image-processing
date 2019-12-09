% 用高斯分布生成一条直线。
function [data] = linem
n = 320;
% 直线为y = ax+b;
a = 2.8;
b = 5;
mu=80;
sigma=20;
x = zeros(0,n);
y = normrnd(mu,sigma,[1 n]);
data = 0*rand(320,2);
for i = 1 : 300
    x(i) = (y(i)-b)/a;
    data(i,1) = x(i);
    data(i,2) = y(i);
end
max_x = ceil(max(x));
min_x = ceil(min(x));
max_y = ceil(max(y));
min_y = ceil(min(y));
s = rand(1,20);
% 随机加如20个离群点。
for i = 1 : 20
    x(300+i) = min_x + (max_x - min_x)*s(i);
    data(300+i,1) = x(300+i);
    data(300+i,2) = y(300+i);
end
m = zeros(max_y,max_x);
m(m==0)=255;
for i = 1 : 320
    x_v = floor(x(i));
    y_v = floor(y(i));
    m(max_y-y_v,x_v) = 0; 
end
% imshow(m);
