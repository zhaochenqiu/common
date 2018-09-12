function [result gradient] = gradientImage(image,number)

if nargin == 1
    number = 32;
end

gradient = 256/number;

value_top       = gradient;
value_bottom    = 0;
value_middle    = 1;

result = image;
judge = 0;



while judge == 0
    
    index1 = image >= value_bottom;
    index2 = image < value_top;
    
    index = index1&index2;
    
    result(index) = value_middle;
    
    value_top = value_top + gradient;
    value_bottom = value_bottom + gradient;
    value_middle = value_middle + 1;
    
    if value_top > 255
        judge = 1;
    end
end



