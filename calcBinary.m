function result = calcBinary(vector)

% Author:Q
% Date:2013/10/27
% Describe:计算二进制的，把一个用向量表示的二进制转化为
% 实际的十进制数字,只是方便写程序，没有实际的用处

% 参数说明:
%    输入参数:
%        vector     用向量表示的二进制
%
%    输出参数:
%        result     运算得到的十进制

[row column] = size(vector);

result = zeros(row,1);

sum = 0;
                % 为了可以计算高维结果
for i = 1:row
    sum = 0;    % 重新归0
    for j = 1:column
        sum = sum + vector(i,j) * (2^(j - 1));
    end
    
    result(i) = sum;
end