p = imread('pic.png');
[height,width,z] = size(p);
n=8;
dh = floor(height/n);
dw = floor(width/n); 
for i = 1 : n
    for j = 1 : n
        s = p(dh*(i-1)+1:dh*i,dw*(j-1)+1:dw*j , :);
        d = (i-1)*n+j;
        path=['./',mat2str(d),'.png']
        imwrite(s,path);
    end
end