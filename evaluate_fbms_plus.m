function  [re_allentry re_norentry re_allvalue re_norvalue re_simentry re_simvalue] = evaluate_fbms(files_sim,data_sim,files_tru,data_tru,threshold_fg)

if nargin == 4
	threshold_fg = 0.2;
end


[row_img column_img byte_img frames_img] = size(data_sim);
[row_tru column_tru byte_tru frames_tru] = size(data_tru);

pos = 1;

all_entry = [];
nor_entry = [];
sim_entry = [];

all_TP = 0;
all_FP = 0;
all_FN = 0;
all_TN = 0;


for i = 1:frames_img
	img = double(data_sim(:,:,:,i));
	img_name = files_sim{i};
	
	tru_name = files_tru{pos};

	judge = ifNameMatch(img_name,tru_name);

	if judge == 1
		tru = double(data_tru(:,:,:,pos));

		trufgimg = tru2fg_fbms(tru);


		similarimg = dealsimilar_t(img);


		[re_maxfm re_pos re_matrix re_entry] = evalution_similar(similarimg,trufgimg);

		all_entry = [all_entry ;i re_entry];

		level = threshold_fg;

		result = getEvaEntry(re_matrix,level);

		nor_entry = [nor_entry ;i result];

		fgimg = thresholdImage(similarimg,threshold_fg);


		[TP FP FN TN] = evalution_entry(fgimg,trufgimg);

		sim_entry = [sim_entry; TP FP FN TN];	
		
		all_TP = all_TP + TP;
		all_FP = all_FP + FP;
		all_FN = all_FN + FN;
		all_TN = all_TN + TN;

		pos = pos + 1;
	end

	if pos > frames_tru
		break;
	end
end



[row column] = size(nor_entry);

re_allentry = all_entry;
re_norentry = nor_entry;
re_simentry = sim_entry;

re_allvalue = [mean(all_entry(1:row,6)) mean(all_entry(2:row,6))];
re_norvalue = [mean(nor_entry(1:row,6)) mean(nor_entry(2:row,6))];
re_simvalue = [all_TP all_FP all_FN all_TN];
