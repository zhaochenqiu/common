function re_image = filter_mode(image,radius)

if nargin == 1
    radius = 1;
end

[row column byte] = size(image);

re_image = image;
length = (radius*2 + 1)^2;

for i = 1 + radius:row - radius
    for j = 1 + radius:column - radius
        for q = 1:byte
            list = reshape(image(i - radius:i + radius,j - radius:j + radius,q),1,length);
            re_value = getMode(list);
            re_image(i,j,q) = re_value;
        end
    end
end
