function result = convolution(image,template)

% Author:Q
% Date:2013/12/12
% Describe:�������ĺ���
% �߽�Ĭ�ϲ�����

% ����˵��:
%    �������:
%        image      ����ͼ��
%        matrix     ��������ľ��
%
%    �������:
%        result     ���֮���ͼ��

result  = image;
deal    = double(image);
[row column num]        = size(image);
[t_row t_column t_num]  = size(template);

if num == t_num
else    %ͼ���������Ȳ�һ����������չ
    temp = template;
    template = zeros(t_row,t_column,num);
    
    for i = 1:num
        template(:,:,i) = temp;
    end
end

list = sum(sum(template));  %����ÿ����ȵ�Ȩֵ

for i = 1:num
    if list(i) == 0
        list(i) = 1;
    end
end

change_r = round(t_row/2 - 0.5);
change_c = round(t_column/2 - 0.5);

for i = (1 + change_r):(row - change_r)
    for j = (1 + change_c):(column - change_c)
        img_block       = deal((i - change_r):(i + change_r),(j - change_r):(j + change_r),:);

        result_block    = img_block .* template;
        result(i,j,:)   = sum(sum(result_block)) ./ list;
    end
end