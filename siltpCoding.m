function [re_vector re_image] = siltpCoding(image,para)

[row column byte] = size(image);

re_image = image;
re_vector = zeros(row,column,8);

for i = 2:row - 1
    for j = 2:column - 1
        matrix = image(i-1:i+1,j-1:j+1,1);
        
        [vector value] = siltpEle(matrix,para);
        
        for q = 1:byte
            re_image(i,j,q) = value;
        end
        
        re_vector(i,j,:) = vector;
    end
end