function re_img = resizeImg(img,row,column)

[row_img column_img byte_img] = size(img);

rate_row    = row/row_img;
rate_column = column/column_img;

re_img = zeros(row,column,byte_img);

for i = 1:row
    for j = 1:column
        pos_r = round(i/rate_row);
        pos_c = round(j/rate_column);

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

        for q = 1:byte_img
            re_img(i,j,q) = img(pos_r,pos_c,q);
        end
    end
end
