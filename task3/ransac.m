data = linem();
figure;
plot(data(:,1), data(:,2), '.');
% axis([-2 18 0 12])
axis equal
hold on
max = 100;     % Number of loops
thresh = 1;    % Bearable distance to line
pretotal = 0;  % Number of points which are inside the threshold
for i = 1:max 
    rand_index = round(randi([1 320],1,2));
    if rand_index(1) == rand_index(2)
        continue;
    end
    pA = [data(rand_index(1),1) data(rand_index(1),2)];
    pB = [data(rand_index(2),1) data(rand_index(2),2)];
    get_line = generate_line([pA;pB]);
    dist=abs(get_line*[data ones(size(data,1),1)]');
    total = sum(dist<thresh);
    
    if total > pretotal
        pretotal = total;
        perfect_pA = pA;
        perfect_pB = pB;
    end
end
k = (perfect_pB(2)-perfect_pA(2))/(perfect_pB(1)-perfect_pA(1));
p_start = [data(1,1), perfect_pA(2)-k*(perfect_pA(1)-data(1,1))];
p_end = [data(end,1), perfect_pA(2)-k*(perfect_pA(1)-data(end,1))];
plot([p_start(1),p_end(1)],[p_start(2),p_end(2)],'r-','lineWidth',2);
