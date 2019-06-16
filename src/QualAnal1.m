% �˹������ҵ����еķ�ֵ����������ƥ��

clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\�Լ����ݿ�\�Լ���׼Ʒ��ͼ'); % ��ȡ�Լ����ݿ�����
[data2,name2,num2] = readall_txt('..\data\�Լ����ݿ�\���������');     % ��ȡ������ֵ
for i = 1:num2                                                       % ���ÿһ�ֻ����ѭ��
    temp1 = sortrows(data2{i},2,'descend');                          % ��ȡ��ǰ��������ݲ���������(��ǿ)��������
    temp1 = temp1(:,1);                                              % ȡ��Ӧ�ĺ�����
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'*','DisplayName',char(strrep(name2(i),'.txt',''))); % ���ƻ�����ֵͼ
    hold on;
    
    for k = 1:num1                                 % �� 20 �ִ��������ƥ��
        temp2 = sortrows(data1{k},2,'descend');    % ��ȡ�������ֵ���ݲ���������(��ǿ)��������
        temp2 = temp2(:,1);                        % ȡ��Ӧ�ĺ�����
        count = 0;
        for m = 1:length(temp2)                    % �����ķ�ֵ�����ݿ�����������ƥ��
            for j = 1:length(temp1)                
                if(abs(temp1(j)-temp2(m)) < 15)    % ����Ӧ��ֵ������֮���ڡ�15֮��
                    count = count+1;               % ƥ��ɹ�һ����
                    break;
                end
            end
        end
        if (count >= length(temp2))
            plot(data1{k}(:,1),data1{k}(:,2),'o','DisplayName',char(strrep(name1(k),'.txt','')));
        end
    end
    legend;
end