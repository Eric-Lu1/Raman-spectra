function data = readall_txt(path)
A = dir(fullfile(path,'*.txt'));
% ��ȡ��A�ĸ�ʽΪ? ?? ?
%? ?? ?? ?? ?? ?? ? name??-- filename
%? ?? ?? ?? ?? ?? ? date??-- modification date
%? ?? ?? ?? ?? ?? ? bytes   -- number of bytes allocated to the file
%? ?? ?? ?? ?? ?? ? isdir   -- 1 if name is a directory and 0 if not
A = struct2cell(A);
num = size(A);
for k =0:num(2)-1
	x(k+1) = A(6*k+1);% �ҳ�name����
end
for k = 1:num(2)
	newpath = strcat(path,'\',x(k));
	data{k} = load(char(newpath));
end
% [EOF] readall_txt.m