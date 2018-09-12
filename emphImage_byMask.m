function re_image = emphImage_byMask(image,mask,color,rate) 

if nargin == 2
	color = [255 0 0];
	rate = 0.5;
end

if nargin == 3
	rate = 0.5;
end

[row column byte] = size(image);

mask = mask(:,:,1);
index = mask == 255;

re_image = image;

for i = 1:byte
	tempimg = image(:,:,i);
	tempimg(index) = tempimg(index)*(1 - rate) + color(i)*rate;
	re_image(:,:,i) = tempimg;
end
