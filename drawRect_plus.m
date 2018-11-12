function re_image = drawRect_plus(image,pos,linewidth,colors)

if nargin == 2
    linewidth = 3;
    colors = [100 101 140];
end

if nargin == 3
    colors = [100 101 140];
end

[row column byte] = size(image);

% covert the gray image to rgb image for showing the color of rectangle
if byte == 1
    temp = zeros(row, column, 3);

    for i = 1:3
        temp(:, :, i) = image;
    end

    image = temp;
end

[row column byte] = size(image);


compare = round(linewidth/2);
re_image = image;

[row_pos column_pos] = size(pos);

for j = 1:row_pos
	for i = 1:linewidth
		left    = pos(j,1) - i + compare;
		top     = pos(j,2) - i + compare;
		right   = pos(j,3) + i - compare;
		bottom  = pos(j,4) + i - compare;
		
		if left > 0 & top > 0 & bottom <= row & right <= column & right > left & bottom > top
			for q = 1:byte
				re_image(top:bottom,left,q)    = colors(j,q);
				re_image(top:bottom,right,q)   = colors(j,q);
				re_image(top,left:right,q)     = colors(j,q);
				re_image(bottom,left:right,q)  = colors(j,q);
			end
		end
	end
end

