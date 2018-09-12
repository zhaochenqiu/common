function re_image = rgbNormal(image)

[row column byte] = size(image);

re_image = image;

for i = 1:row
	for j = 1:column
		value = sum(image(i,j,:));

		if value == 0
			value = 1;
		end

		re_image(i,j,:) = 255*(image(i,j,:)/value);
	end
end
