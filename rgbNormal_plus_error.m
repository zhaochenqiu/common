function re_image = rgbNormal(image)

[row column byte] = size(image);

re_image = image;


maxmatrix = max(image,3);

size(maxmatrix)

re_image(:,:,1) = image(:,:,1) ./ maxmatrix;
re_image(:,:,2) = image(:,:,2) ./ maxmatrix;
re_image(:,:,3) = image(:,:,3) ./ maxmatrix;

re_image = re_image*755;

