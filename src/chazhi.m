clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\�Լ���׼Ʒ��ͼ'); 
[data2,name2,num2] = readall_txt('..\data\���������');
name1=strrep(name1,'.txt','');
name2=strrep(name2,'.txt','');
datacell=cell(1,num2);
load cf;
for i = 1:num2                  % ��������ֵ
    data(:,1) = data1{1}(:,1);
    data(:,2) = interp1(data2{i}(:,1),data2{i}(:,2),data1{1}(:,1),'spline');
    datacell{i} = data;
end

for i = 1:num2
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'DisplayName',name2{i});
    hold on;
    y = datacell{i}(:,2);             % y
    for j = 1:length(y)
        if y(j) < 500
            y(j) = 0;
        end
    end
    X = ones(length(y),1);            % [ones(n,1), X]
    cf1 = cf{i};                      % �ɷֵ�����
    for j = 1:cf1(1)                  % ���гɷ� 
%         plot(data1{cf1(j+1)}(:,1),data1{cf1(j+1)}(:,2),'DisplayName',name1{cf1(j+1)});
        x = data1{cf1(j+1)}(:,2);     % ��һ�ֳɷ�
        for k = 1: length(x)
            if x(k) < 500 
                x(k) = 0;
            end
        end
        X = [X, x];                   % ƴ��   
    end
    [b,bint,r,rint,s] = regress(y,X);
    b = b(2:length(b));
    b(:,2) = 1:length(b);
    b = sortrows(b,1,'descend')
    plot(data1{cf1(b(1,2)+1)}(:,1),data1{cf1(b(1,2)+1)}(:,2),'DisplayName',name1{cf1(b(1,2)+1)});
    plot(data1{cf1(b(2,2)+1)}(:,1),data1{cf1(b(2,2)+1)}(:,2),'DisplayName',name1{cf1(b(2,2)+1)});
    legend;
end

