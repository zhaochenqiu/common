function [re_image obj_left obj_top obj_right obj_bottom obj_count]= getObjByFg(fgimage,mask,start_r,start_c)

[row column byte] = size(fgimage);

stack = [start_r start_c];

judge = 0;

resultimage = zeros(row,column);
obj_count = 0;

obj_left    = column;
obj_right   = 1;
obj_top     = row;
obj_bottom  = 1;

while judge == 0
    [stack element] = stackpop(stack);
    
    pos_r = element(1);
    pos_c = element(2);
    
    if mask(pos_r,pos_c) == 0
        break;
    end
    
    if fgimage(pos_r,pos_c) == 255
        resultimage(pos_r,pos_c) = 255;
        
        if obj_top > pos_r
            obj_top = pos_r;
        end
        
        if obj_bottom < pos_r
            obj_bottom = pos_r;
        end
        
        if obj_left > pos_c
            obj_left = pos_c;
        end
        
        if obj_right < pos_c
            obj_right = pos_c;
        end
        
        obj_count = obj_count + 1;

        if ifFill(pos_r - 1,pos_c,resultimage,row,column) == 1
			stack = stackpush(stack,[pos_r - 1 pos_c]);
		end

		if ifFill(pos_r,pos_c - 1,resultimage,row,column) == 1
			stack = stackpush(stack,[pos_r pos_c - 1]);
		end

		if ifFill(pos_r + 1,pos_c,resultimage,row,column) == 1
			stack = stackpush(stack,[pos_r + 1 pos_c]);
		end

		if ifFill(pos_r,pos_c + 1,resultimage,row,column) == 1
			stack = stackpush(stack,[pos_r pos_c + 1]);
		end	
    end
    
    [judge_row judge_column] = size(stack);
    
    if judge_row == 0 & judge_column == 0
        judge = 1;
    end
end

re_image = resultimage;