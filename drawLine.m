function re_image = drawLine(template,pos_s,pos_e,linewidth,color)

[row column byte] = size(template);

interchange = 0;

distance_x = abs(pos_e(1) - pos_s(1));
distance_y = abs(pos_e(2) - pos_s(2));

s1 = getSign(pos_e(1) - pos_s(1));
s2 = getSign(pos_e(2) - pos_s(2));

if distance_x < distance_y
	temp		= distance_x;
	distance_x	= distance_y;
	distance_y	= temp;

	interchange = 1;
end

re_image = template;

e = 2*distance_y - distance_x;
p = pos_s;

for i = 1:distance_x

	x = p(1);
	y = p(2);
	colorimg = zeros(2*linewidth + 1,2*linewidth + 1,3);
	
	colorimg(:,:,1) = color(1);
	colorimg(:,:,2) = color(2);
	colorimg(:,:,3) = color(3);

	left	= x - linewidth;
	right	= x + linewidth;
	top		= y - linewidth;
	bottom	= y + linewidth;

	if left < 1
		left = 1;
	end

	if top < 1
		top = 1;
	end

	if right < 1
		right = 1;
	end

	if bottom < 1
		bottom = 1;
	end

	if left > column
		left = column;
	end

	if top > row
		top = row;
	end

	if right > column
		right = column;
	end

	if bottom > row
		bottom = row;
	end

	re_image(top:bottom,left:right,:) = colorimg;

	if e > 0
		if interchange == 1
			p(1) = p(1) + s1;
		else
			p(2) = p(2) + s2;
		end

		e = e - 2*distance_x;
	end

	if interchange == 1
		p(2) = p(2) + s2;
	else
		p(1) = p(1) + s1;
	end

	e = e + 2*distance_y;
end
