clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\�Լ���׼Ʒ��ͼ');
[data2,name2,num2] = readall_txt('..\data\���������');
for i = 1:num1
    temp = cell2mat(data1(i));
    plot(temp(:,1),temp(:,2))
    name1(i) = strrep(name1(i),'.txt','');
    hold on;
end
title('��������(��׼)')
xlabel('����');
ylabel('��ǿ');
legend(name1);

for i = 1:num2
    temp = cell2mat(data2(i));
    name2(i) = strrep(name2(i),'.txt','');
    figure;
    plot(temp(:,1),temp(:,2),'DisplayName',char(name2(i)));
    hold on;
    for j = 1:num1
        if(contains(name2(i),name1(j)))
            temp = cell2mat(data1(j));
            plot(temp(:,1),temp(:,2),'DisplayName',char(name1(j)))
        end
    end
    xlabel('����');
    ylabel('��ǿ');
    legend;
end