function re_image = R_siltpCodingC(image,para,range)

% 变种silp编码

[row column byte] = size(image);
re_image = image;

for i = range + 1:row - range
    for j = range + 1:column - range

        top     = i - range;
        left    = j - range;
        bottom  = i + range;
        right   = j + range;

        matrix = image(top:bottom,left:right,1);
%        matrix = image(i-1:i+1,j-1:j+1,1);
        middle_r = round(range/2);
        middle_c = round(range/2);
        compare = matrix(middle_r,middle_c);

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

for i = 1:range
    re_image(i,:,:)     = re_image(range + 1,:,:);          % 边界处理   
    re_image(:,i,:)     = re_image(:,range + 1,:);
    re_image(row - i + 1,:,:)       = re_image(row - range,:,:);
    re_image(:,column - i + 1,:)    = re_image(:,column - range,:);
end

% re_image(1,:,:)     = re_image(2,:,:);          % 边界处理
%re_image(row,:,:)   = re_image(row - 1,:,:);
% re_image(:,1,:)     = re_image(:,2,:);
%re_image(:,column,:)     = re_image(:,column - 1,:);
