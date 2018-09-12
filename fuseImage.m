function result = fuseImage(image,mask,color,weight)

if nargin == 2
	color = [255 255 255];
	weight = 0.5;
end

if nargin == 3
	weight = 0.5;
end

[row column byte] = size(image);

result = image;

for i = 1:row
	for j = 1:column

		if mask(i,j,1) == 255
			for n = 1:byte
				result(i,j,n) = image(i,j,n)*(1 - weight) + color(n)*weight;
			end
		end

	end
end



