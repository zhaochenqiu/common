function [re_files re_data] = truFilter_PROB(files,data)

[row_data column_data byte_data frames_data] = size(data);

re_files	= files;
re_data		= data;

count = 1;

for i = 1:frames_data
	filename = files{i};
	pos = find(filename == 'P');  % 利用文件名中有 PROB 的特点
	[row_t column_t] = size(pos);

	if row_t == 0 | column_t == 0
		re_data(:,:,:,count) = data(:,:,:,i);
		re_files{count} = files{i};
		count = count + 1;
	end
end

count = count - 1;
re_data = re_data(:,:,:,1:count);
re_files = re_files(1:count);

