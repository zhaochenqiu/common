function [re_maxfm re_pos re_matrix re_entry] = evalution_similar(similarimg,truthimg)

[row_img column_img byte_img] = size(similarimg);
fgimage = zeros(row_img,column_img,1);

re_matrix = [];
re_maxfm = -1;
re_pos = -1;
re_entry = [0 0 0 0 0];


judge = 0;
i = 0;


while judge == 0
     index = similarimg > i;
     fgimage(index) = 255;
     index = ~index;
     fgimage(index) = 0;
     
     [Re Sp Pr Fm evajudge] = evalution_detection(fgimage,truthimg);
    
	 if evajudge < 0
		 judge = -1;
		 break;
	 end

     re_matrix = [re_matrix ;i Re Sp Pr Fm];
     
     if re_maxfm < Fm
         re_maxfm = Fm;
         re_pos = i;
         re_entry = [i Re Sp Pr Fm ];
     end
  %   showSchedule(i,100,'evalution_similar');
	 i = i + 0.01;
 end
