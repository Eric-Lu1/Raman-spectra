clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\��ֵ\�Լ���׼Ʒ��ͼ');%��ȡ��ֵ����
[data2,name2,num2] = readall_txt('..\data\��ֵ\���������');
for i = 1:num2 %���ÿһ�ֻ����ѭ��
    temp1 = sortrows(data2{i},2,'descend'); %��ȡ��ǰ��������ݲ���������(��ǿ)��������
    temp1 = temp1(:,1);%ȡ��Ӧ�ĺ�����
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'*','DisplayName',char(strrep(name2(i),'.txt','')));%���ƻ�����ֵ*ͼ
    hold on;
    j = 1;
    for k = 1:num1 %���ÿһ�ֻ����ѭ��20�ִ�����
        temp2 = sortrows(data1{k},2,'descend');%��ȡ�������ֵ���ݲ���������(��ǿ)��������
        temp2 = temp2(:,1);%ȡ��Ӧ�ĺ�����
        count = 0;%����
        for m = 1:4 %ȡ������ǰ4���ֵ�Ƚ�
            if(abs(temp1(j)-temp2(m)) < 10) %����Ӧ��ֵ������֮���ڡ�10֮��
                count = count + 1; %���Ӽ���
                j=j+1; %��Ӧһ����ֵ
            end
        end
        if(count >= 2) %������2�ַ�ֵ��Ӧ ���жϵ�ǰ����ﺬ�иô����� ��ӡ�������ֵoͼ
            plot(data1{k}(:,1),data1{k}(:,2),'o','DisplayName',char(strrep(name1(k),'.txt','')));
        end
    end
    legend;
end