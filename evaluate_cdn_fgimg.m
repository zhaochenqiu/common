function re_simvalue = evaluate_cdn_fgimg(files_sim,data_sim,files_tru,data_tru)


[row_img column_img byte_img frames_img] = size(data_sim);
[row_tru column_tru byte_tru frames_tru] = size(data_tru);

pos = 1;

all_TP = 0;
all_FP = 0;
all_FN = 0;
all_TN = 0;

re_simentry = [];

for i = 1:frames_img
    tic
	img = double(data_sim(:,:,:,i));
	img_name = files_sim{i};


	tru = double(data_tru(:,:,:,pos));

	trufgimg = tru2fg_cdn(tru);

    fgimg = img(:,:,1);

	[TP FP FN TN] = evalution_entry(fgimg,trufgimg);
%	re_simentry = [re_simentry; TP FP FN TN];
	all_TP = all_TP + TP;
	all_FP = all_FP + FP;
	all_FN = all_FN + FN;
	all_TN = all_TN + TN;

	pos = pos + 1;
%	[i all_TP all_FP all_FN all_TN ]
    time = toc;
    [i time]
end

re_simvalue = [all_TP all_FP all_FN all_TN];
