function re_image = emphImage_byMask_plus(image,mask,rect,color,rate) 

if nargin == 3
	color = [255 0 0];
	rate = 0.5;
end

if nargin == 4
	rate = 0.5;
end

[row column byte] = size(image);

left	= rect(1);
top		= rect(2);
right	= rect(3);
bottom	= rect(4);

mask = mask(:,:,1);
index = mask == 255;

re_image = image;

for i = 1:byte
	tempimg = image(top:bottom,left:right,i);
	tempimg(index) = tempimg(index)*(1 - rate) + color(i)*rate;
	re_image(top:bottom,left:right,i) = tempimg;
end
