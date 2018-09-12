function re_image = maskImage(image,mask,background)

if nargin == 2
	background = [255 255 255];
end

[row column byte] = size(image);

re_image = zeros(row,column,byte);

index = mask == 255;

for i = 1:byte
	re_image(:,:,i) = re_image(:,:,i) + background(i);
	temp1 = image(:,:,i);
	temp2 = re_image(:,:,i);

	temp2(index)	= temp1(index);
	re_image(:,:,i) = temp2;
end
