function re_index = filterPeak_temp(index,valuelist)

re_index = index;

maxvalue = max(valuelist);
maxvalue = maxvalue(1);

maplist = zeros(1,maxvalue);

[row_value column_value] = size(valuelist);

length = row_value;

if length < column_value
	length = column_value;
end

for i = 1:length
	pos = valuelist(i);
	maplist(pos) = 1;
end

[row column] = size(re_index);

for i = 1:column
	if index(i) ~= 0
		pos = index(i);
		re_index(i) = maplist(pos);
	end
end
