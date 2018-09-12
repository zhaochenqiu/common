function re_entry = getEvaEntry(matrix,threshold)


[row_mat column_mat] = size(matrix);

re_entry = zeros(1,column_mat) - 1;

judge = 0;

for i = 1:row_mat - 1
	if (matrix(i,1) - threshold )*(matrix(i + 1,1) - threshold) < 0
		re_entry = matrix(i,:);
		judge = 1;
	end
end

if judge == 0
	re_entry = zeros(1,5);
end

