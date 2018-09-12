function re_image = rgbNormal(image)

[row column byte] = size(image);

re_image = image;

for i = 1:row
	for j = 1:column
		valuelist = max(image(i,j,:));
		value = valuelist(1);

		if value == 0
			value = 1;
		end

		re_image(i,j,:) = 255*(image(i,j,:)/value);
	end
end
