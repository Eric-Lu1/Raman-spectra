clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\�Լ���׼Ʒ��ͼ');
[data2,name2,num2] = readall_txt('..\data\���������');
num = 1;
for i = 1:num1
    temp = cell2mat(data1(i));
    [peak,loc] = findpeaks(temp(:,2));
    [b,index] = sort(peak);
    [dim,~] = size(peak);
    tmp = loc(index(dim-9:dim));
    pks(num) = mat2cell(tmp,10,1);
    num = num + 1;
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
    [peak,loc] = findpeaks(temp(:,2));
    [b,index] = sort(peak);
    [dim,~] = size(peak);
    tmp = loc(index(dim-9:dim));
    pks(num) = mat2cell(tmp,10,1);
    num = num + 1;
    name2(i) = strrep(name2(i),'.txt','');
    figure;
    plot(temp(:,1),temp(:,2),'DisplayName',char(name2(i)));
    hold on;
    for j = 1:num1
        if(contains(name2(i),name1(j)))
            temp = cell2mat(data1(j));
            plot(temp(:,1),temp(:,2),'DisplayName',char(name1(j)));
        end
    end
    xlabel('����');
    ylabel('��ǿ');
    legend;
end