function [b0 b1] = linearRegression(data)

%Author:Q
%Date:2013/8/31
%Describe:简单线性回归的函数
%其中 函数方程为 y = b0 + b1x

%参数解释:
%   输入参数:
%       data    需要回归的数据
%           data(:,1) 因变量系数
%           data(:,2) 自变量系数
%   输出参数:
%       b0      常量系数 实际是b0*x^0 = b0*1 = b0
%       b1      自变量一次方系数

[row column] = size(data);

avgy = sum(data(:,1))/row;
avgx = sum(data(:,2))/row;

data1 = data(:,1) - avgy;
data2 = data(:,2) - avgx;

sum1 = sum(data1 .* data2);
sum2 = sum(data2 .* data2);

b1 = sum1/sum2;
b0 = avgy - b1 * avgx;
