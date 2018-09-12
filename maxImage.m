function re_image = maxImage(image) 

[row column byte] = size(image);

re_image = zeros(row,column);

for i = 1:row
	for j = 1:column
		value = max(image(i,j,:));
		value = value(1);

		re_image(i,j) = value;
	end

end
