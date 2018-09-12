function re_image = filter_median(image,radius)

if nargin == 1
    radius = 1;
end

[row column byte] = size(image);

re_image = image;

for i = 1 + radius:row - radius
    for j = 1 + radius:column - radius
        for q = 1:byte
            re_value = getMedian(image(i - radius:i + radius,j - radius:j + radius,q));
            re_image(i,j,q) = re_value;
        end
    end
end
