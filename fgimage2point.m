function re_stack = fgimage2point(image)

[row column byte] = size(image);

if byte ~= 1
    image = grayImage(image);
end

re_stack = [];

for i = 1:row
    for j = 1:column
        if image(i,j) == 255
            re_stack = [re_stack; i j];
        end
    end
end