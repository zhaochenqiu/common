function [re_fm re_frame] = evaluate_cdn_double(files_sim,data_sim,files_tru,data_tru,threshold_big,threshold_sma,threshold_range)

[row_img column_img byte_img frames_img] = size(data_sim);
[row_tru column_tru byte_tru frames_tru] = size(data_tru);

pos = 1;

fm_best     = -1;
frame_best  = -1;

re_simentry = [];

for i = 1:frames_img
    tic
	img = double(data_sim(:,:,:,i));
	img_name = files_sim{i};

	tru = double(data_tru(:,:,:,pos));

	trufgimg = tru2fg_cdn(tru);

    fgimg = doubleThreshold(img,threshold_big*255,threshold_sma*255,threshold_range);


	[TP FP FN TN] = evalution_entry(fgimg,trufgimg);

    re = TP / (TP + FN);
    pr = TP / (TP + FP);

    fm = (2*pr*re)/(pr + re);

    if isnan(fm) == 1
        fm = 0;
    end

    if fm > fm_best
        fm_best     = fm;
        frame_best  = i;
    end

	pos = pos + 1;
    time = toc;
end

re_fm = fm_best;
re_frame = frame_best;

% re_simvalue = [all_TP all_FP all_FN all_TN];
