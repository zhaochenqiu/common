function [b0 b1] = linearRegression(data)

%Author:Q
%Date:2013/8/31
%Describe:�����Իع�ĺ���
%���� ��������Ϊ y = b0 + b1x

%��������:
%   �������:
%       data    ��Ҫ�ع������
%           data(:,1) �����ϵ��
%           data(:,2) �Ա���ϵ��
%   �������:
%       b0      ����ϵ�� ʵ����b0*x^0 = b0*1 = b0
%       b1      �Ա���һ�η�ϵ��

[row column] = size(data);

avgy = sum(data(:,1))/row;
avgx = sum(data(:,2))/row;

data1 = data(:,1) - avgy;
data2 = data(:,2) - avgx;

sum1 = sum(data1 .* data2);
sum2 = sum(data2 .* data2);

b1 = sum1/sum2;
b0 = avgy - b1 * avgx;
