% ���� cd �εķ�ֵ����ͼƥ��ɷ�

clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\��ֵ\�Լ���׼Ʒ��ͼ');%��ȡ��ֵ����
[data2,name2,num2] = readall_txt('..\data\��ֵ\���������');
for i = 1:num2                               % ���ÿһ�ֻ����ѭ��
    pipei = zeros(20,2);
    temp1 = sortrows(data2{i},2,'descend');  %��ȡ��ǰ��������ݲ���������(��ǿ)��������
    temp1 = temp1(:,1);                      %ȡ��Ӧ�ĺ�����
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'*','DisplayName',char(strrep(name2(i),'.txt',''))); % ���ƻ�����ֵ*ͼ
    hold on;
    
    for k = 1:num1                                 % ���ÿһ�ֻ����ѭ��20�ִ�����
        pipei(k, 2) = k;                           % ����
        temp2 = sortrows(data1{k},2,'descend');    % ��ȡ�������ֵ���ݲ���������(��ǿ)��������
        temp2 = temp2(:,1);                        % ȡ��Ӧ�ĺ�����
        for m = 1:3                                % ȡ������ǰ3���ֵ�Ƚ�
            for j = 1:5                            % ������ǰ 5 �߷�
                if(abs(temp1(j)-temp2(m)) < 10)    % ����Ӧ��ֵ������֮���ڡ�10֮��
                    pipei(k,1) = pipei(k,1) + 4-m; % Ȩֵ�Ƚ�
                end
            end
        end
    end
    res = sortrows(pipei, 1, 'descend');
    plot(data1{res(1,2)}(:,1),data1{res(1,2)}(:,2),'o','DisplayName',char(strrep(name1(res(1,2)),'.txt','')));
    plot(data1{res(2,2)}(:,1),data1{res(2,2)}(:,2),'o','DisplayName',char(strrep(name1(res(2,2)),'.txt','')));
    legend;
end