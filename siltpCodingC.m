function re_image = siltpCodingC(image,para)

% 变种silp编码

[row column byte] = size(image);
re_image = image;

for i = 2:row - 1
    for j = 2:column - 1
        matrix = image(i-1:i+1,j-1:j+1,1);
        compare = matrix(2,2);
        
        minvalue = compare * (1 - para);
        maxvalue = compare * (1 + para);
        
        value1 = matrix > maxvalue;
        value2 = matrix < minvalue;
        
        value = sum(sum(value1)) + sum(sum(value2));
        
        for q = 1:byte
            re_image(i,j,q) = value;
        end
        
    end
end

re_image(1,:,:)     = re_image(2,:,:);          % 边界处理
re_image(row,:,:)   = re_image(row - 1,:,:);
re_image(:,1,:)     = re_image(:,2,:);
re_image(:,column,:)     = re_image(:,column - 1,:);
