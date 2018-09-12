function re_histogram = getHistogram_native(image,maskimage,range,maxvalue)

[row column byte] = size(image);

if nargin == 2
	range = 4;
	maxvalue = 255;
end

if nargin == 3
	maxvalue = 255;
end

length = round(maxvalue/range) + 1;

temphistogram = zeros(byte,length);

for i = 1:row
	for j = 1:column
		if maskimage(i,j) == 255
			for q = 1:byte
				value = image(i,j,q);
				pos = round(value/range) + 1;

				temphistogram(q,pos) = temphistogram(q,pos) + 1;
			end
		end
	end
end

re_histogram = [];
for i = 1:byte
	re_histogram = [re_histogram temphistogram(i,:)];
end
