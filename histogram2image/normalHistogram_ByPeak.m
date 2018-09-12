function [re_hist1 re_hist2] = normalHistogram_ByPeak(hist1,index1,hist2,index2)

[row1 column1] = size(hist1);
[row2 column2] = size(hist2);

list1 = find(index1 == 1);
list2 = find(index2 == 1);

re_hist1 = [];
re_hist2 = [];

[row_pos1 column_pos1] = size(list1);
[row_pos2 column_pos2] = size(list2);

if column_pos1 ~= column_pos2
	column_pos1
	column_pos2
	list1
	list2
	disp('the dimension of two index is different');
	input('please interrupt');
end

left = list1(1);
right = list1(2);
temphist1 = hist1(left:right);

left = list2(1);
right = list2(2);
temphist2 = hist2(left:right);

[row_temp1 column_temp1] = size(temphist1);
[row_temp2 column_temp2] = size(temphist2);

if column_temp1 > column_temp2
	temphist2 = resizeHistogram(temphist2,column_temp1);
end

if column_temp1 < column_temp2
	temphist1 = resizeHistogram(temphist1,column_temp2);
end

re_hist1 = [re_hist1 temphist1];
re_hist2 = [re_hist2 temphist2];

for i = 2:column_pos1 - 1
	left = list1(i) + 1;
	right = list1(i + 1);

	temphist1 = hist1(left:right);

	left = list2(i) + 1;
	right = list2(i + 1);
	temphist2 = hist2(left:right);

	[row_temp1 column_temp1] = size(temphist1);
	[row_temp2 column_temp2] = size(temphist2);

	if column_temp1 > column_temp2
		temphist2 = resizeHistogram(temphist2,column_temp1);
	end

	if column_temp1 < column_temp2
		temphist1 = resizeHistogram(temphist1,column_temp2);
	end

	re_hist1 = [re_hist1 temphist1];
	re_hist2 = [re_hist2 temphist2];
end
