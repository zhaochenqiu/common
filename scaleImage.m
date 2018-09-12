function re_image = scaleImage(image,scale)

if nargin == 1
	scale = 2;
end

[row column byte] = size(image);

re_row = round(row*scale);
re_column = round(column*scale);

re_image = zeros(re_row,re_column,byte);

for i = 1:re_row
	for j = 1:re_column
		pos_r = round(i/scale);
		pos_c = round(j/scale);

		if pos_r < 1
			pos_r = 1;
		end

		if pos_c < 1
			pos_c = 1;
		end

		if pos_r > row
			pos_r = row;
		end

		if pos_c > column
			pos_c = column;
		end

		for q = 1:byte
			re_image(i,j,q) = image(pos_r,pos_c,q);
		end
	end
end
