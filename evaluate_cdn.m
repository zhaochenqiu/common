function [re_allentry re_allvalue re_simentry re_simvalue] = evaluate_cdn(files_sim,data_sim,files_tru,data_tru,threshold_fg)

if nargin == 4
	threshold_fg = 0.2;
end


[row_img column_img byte_img frames_img] = size(data_sim);
[row_tru column_tru byte_tru frames_tru] = size(data_tru);

pos = 1;

all_entry = [];
nor_entry = [];

all_TP = 0;
all_FP = 0;
all_FN = 0;
all_TN = 0;

re_simentry = [];

for i = 1:frames_img
	img = double(data_sim(:,:,:,i));
	img_name = files_sim{i};
	


	tru = double(data_tru(:,:,:,pos));

	trufgimg = tru2fg_cdn(tru);


	similarimg = dealsimilar_t(img);

	[re_maxfm re_pos re_matrix re_entry] = evalution_similar(similarimg,trufgimg);

	all_entry = [all_entry ;i re_entry];

	fgimg = thresholdImage(similarimg,threshold_fg);

	[TP FP FN TN] = evalution_entry(fgimg,trufgimg);
	re_simentry = [re_simentry; TP FP FN TN];
	all_TP = all_TP + TP;
	all_FP = all_FP + FP;
	all_FN = all_FN + FN;
	all_TN = all_TN + TN;

	pos = pos + 1;
	i
end



[row column] = size(all_entry);

re_allentry = all_entry;

re_allvalue = [mean(all_entry(1:row,6)) mean(all_entry(2:row,6))];

re_simvalue = [all_TP all_FP all_FN all_TN];

%{
[row column]
size(all_entry)

re_allvalue

input('paise')
%}
