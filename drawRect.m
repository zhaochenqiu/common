function re_image = drawRect(image,pos,linewidth,color)

if nargin == 2
    linewidth = 3;
    color = [100 101 140];
end

if nargin == 3
    color = [100 101 140];
end

[row column byte] = size(image);

compare = round(linewidth/2);
re_image = image;

for i = 1:linewidth
    left    = pos(1) - i + compare;
    top     = pos(2) - i + compare;
    right   = pos(3) + i - compare;
    bottom  = pos(4) + i - compare;
    
    if left > 0 & top > 0 & bottom <= row & right <= column & right > left & bottom > top
        for j = 1:byte
            re_image(top:bottom,left,j)    = color(j);
            re_image(top:bottom,right,j)   = color(j);
            re_image(top,left:right,j)     = color(j);
            re_image(bottom,left:right,j)  = color(j);
        end
    end
end
