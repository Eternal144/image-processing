[H, theta, rho]= hough1();
%imshow(theta,rho,H,[],'notruesize'),
axis on,
axis normal
%xlabel('\theta'),ylabel('rho');
a = houghpeaks(H,5);
[r,c]=houghpeaks(H,5);
hold on
lines=houghlines(f,theta,rho,r,c);
figure,imshow(f,[]),title('Hough Transform Detect Result'),
hold on
for k=1:length(lines) 
    xy=[lines(k).point1;lines(k).point2];
plot(xy(:,1),xy(:,2),'LineWidth',4,'Color',[.6 .6 .6]);
end