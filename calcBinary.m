function result = calcBinary(vector)

% Author:Q
% Date:2013/10/27
% Describe:��������Ƶģ���һ����������ʾ�Ķ�����ת��Ϊ
% ʵ�ʵ�ʮ��������,ֻ�Ƿ���д����û��ʵ�ʵ��ô�

% ����˵��:
%    �������:
%        vector     ��������ʾ�Ķ�����
%
%    �������:
%        result     ����õ���ʮ����

[row column] = size(vector);

result = zeros(row,1);

sum = 0;
                % Ϊ�˿��Լ����ά���
for i = 1:row
    sum = 0;    % ���¹�0
    for j = 1:column
        sum = sum + vector(i,j) * (2^(j - 1));
    end
    
    result(i) = sum;
end