
[X,Y,min_v,max_v] = linem();
n=120;
x2=sum(X.^2);       % ��(xi^2)
x1=sum(X);          % ��(xi)
x1y1=sum(X.*Y);     % ��(xi*yi)
y1=sum(Y);          % ��(yi)
 
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %���ֱ��б��b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %���ֱ�߽ؾ�
%��ͼ
% �Ȱ�ԭʼ���ݵ�����ɫʮ�������
figure
plot(X,Y,'+');      
hold on
% �ú�ɫ������ϳ���ֱ��
px=linspace(min_v,max_v,120);%����ֱ����������Լ�ʵ�������д
py=a*px+b;
plot(px,py,'r');