
[X,Y,min_v,max_v] = linem();
n=120;
x2=sum(X.^2);       % 求Σ(xi^2)
x1=sum(X);          % 求Σ(xi)
x1y1=sum(X.*Y);     % 求Σ(xi*yi)
y1=sum(Y);          % 求Σ(yi)
 
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %解出直线截距
%作图
% 先把原始数据点用蓝色十字描出来
figure
plot(X,Y,'+');      
hold on
% 用红色绘制拟合出的直线
px=linspace(min_v,max_v,120);%这里直线区间根据自己实际需求改写
py=a*px+b;
plot(px,py,'r');