function [data, name, num] = readall_txt(path)
A = dir(fullfile(path,'*.txt'));% ��ȡĿ¼
A = struct2cell(A);% ת��Ԫ������ �����ȡsize
[~,num] = size(A);
for k =0:num-1
	name(k+1) = A(6*k+1);% �ҳ�name����
end
for k = 1:num
	newpath = strcat(path,'\',name(k));
	data{k} = load(char(newpath));% ��ȡ����
end