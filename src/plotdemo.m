clear;clc;
[data,name] = readall_txt('..\data\�Լ���׼Ʒ��ͼ');
for i = 1:20
    temp = cell2mat(data(i));
    plot(temp(:,1),temp(:,2))
    name(i) = strrep(name(i),'.txt','');
    hold on;
end
title('��������')
xlabel('����');
ylabel('��ǿ');
legend(name);