function [re_image gradient] = gradientImage(image,number)

if nargin == 1
    number = 32;
end

gradient = 255/number;

[row column byte] = size(image);

value_top       = gradient;
value_bottom    = 0;
value_middle    = 0;

re_image = zeros(row,column,byte);
judge = 0;

for i = 1:number + 1
    index1 = image >= value_bottom;
    index2 = image < value_top;
    
    index = index1&index2;
    
    re_image(index) = value_middle;
    
    value_top = value_top + gradient;
    value_bottom = value_bottom + gradient;
    value_middle = value_middle + 1;
end