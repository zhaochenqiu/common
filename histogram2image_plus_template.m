function [re_scale re_image] = histogram2image_plus(histogram,mark,fgcolor,color,scale)

[row column] = size(histogram);

maxvalue = max(histogram);
maxvalue = maxvalue(1);

if maxvalue == 0
	maxvalue = 1;
end

width	= column;
height = round(width*1.2);

if nargin == 2
	color = [	250	0	0
				180	180	180
				0	250 0
				255	70  255];

	fgcolor = [100 101 140];

	scale = width/maxvalue;
end

if nargin == 3
	color = [	250	0	0
				180	180	180
				0	250 0
				255	70  255];

	scale = width/maxvalue;
end

if nargin == 4
	scale = width/maxvalue;
end



[row_color column_color] = size(color);

re_image = zeros(height,width,column_color);

[row_img column_img byte_img] = size(re_image);

for i = 1:column_img
	height = histogram(i);
	height = round(height*scale);

	for j = 1:height
		pos = row_img - j + 1;

		if mark(i) == 0
			for q = 1:byte_img
				re_image(pos,i,q) = fgcolor(q);
			end
		end

		if mark(i) ~= 0
			pos_color = mark(i);

			for q = 1:byte_img
				re_image(pos,i,q) = color(pos_color,q);
			end
		end

	end
end

re_scale = scale;
