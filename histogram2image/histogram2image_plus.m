function [re_scale re_image] = histogram2image_plus(histogram,fgcolor,mark,color,scale)

[row column] = size(histogram);

width = column;
height = round(width*1.2);


if nargin < 5
	maxvalue = max(histogram);
	maxvalue = maxvalue(1);

	if maxvalue == 0
		maxvalue = 1;
	end

	scale = column/maxvalue;
end

if nargin < 4
	if nargin == 3
		maxmark = max(mark);
		maxmark = maxmark(1);

		color = round(rand(maxmark,3)*255);
	else
		color = [100 101 140];
	end
end

if nargin < 3
	mark = zeros(1,column);
end

if nargin < 2
	fgcolor = [100 101 140];
end

if nargin == 5
	maxvalue = max(histogram);
	maxvalue = maxvalue(1);

	tempheight = maxvalue*scale;
	height = tempheight*1.2;	
end

[row_clr column_clr] = size(color);

re_image = zeros(height,width,column_clr);

[row_img column_img byte_img] = size(re_image);

for i = 1:column_img
	if mark(i) == 0
		height = histogram(i);
		height = round(height*scale);

		for j = 1:height
			pos = row_img - j + 1;

			for q = 1:byte_img
				re_image(pos,i,q) = fgcolor(q);
			end
		end
	end

	if mark(i) ~= 0
		pos_clr = mark(i);

		height = histogram(i);
		height = round(height*scale);

		for j = 1:height
			pos = row_img - j + 1;

			for q = 1:byte_img
				re_image(pos,i,q) = color(pos_clr,q);
			end
		end
	end
end

re_scale = scale;
