function result = convolution(image,template)

% Author:Q
% Date:2013/12/12
% Describe:计算卷积的函数
% 边界默认不处理

% 参数说明:
%    输入参数:
%        image      输入图像
%        matrix     进行运算的卷积
%
%    输出参数:
%        result     卷积之后的图像

result  = image;
deal    = double(image);
[row column num]        = size(image);
[t_row t_column t_num]  = size(template);

if num == t_num
else    %图像和算子深度不一样，算子扩展
    temp = template;
    template = zeros(t_row,t_column,num);
    
    for i = 1:num
        template(:,:,i) = temp;
    end
end

list = sum(sum(template));  %保存每个深度的权值

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