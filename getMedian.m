function re_value = getMedian(matrix)

size_result = size(matrix); % 处理高维数组

[row column] = size(size_result);

length = 1;

for i = 1:row
    for j = 1:column
        length = length*size_result(i,j);
    end
end

list = reshape(matrix,1,length);
list = sort(list);

pos = round(length/2);

re_value = list(pos);