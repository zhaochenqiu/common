function result = ifFill(pos_r,pos_c,image,max_row,max_column)

result = 0;

judge1 = 0;
judge2 = 0;

if pos_r > 0 & pos_r <= max_row
	judge1 = 1;
end

if pos_c > 0 & pos_c <=max_column
	judge2 = 1;
end

if judge1 == 1 & judge2 == 1
	if image(pos_r,pos_c) ~= 255
		result = 1;
	end
end

