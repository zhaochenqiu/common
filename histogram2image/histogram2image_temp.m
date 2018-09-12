function re_image = histogram2image_temp(mark,color)

[row column] = size(mark);

re_image = zeros(column,column);

[row_img column_img] = size(re_image);

byte_img = 3;

for j = 1:column_img
	if mark(j) ~= 0
		pos = mark(j);

		for i = 1:row_img
			for q = 1:byte_img
				re_image(i,j,q) = color(pos,q);
			end
		end
	end
end
