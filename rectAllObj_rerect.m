function re_rect = rectAllObj_rerect(image,min_objnum)

if nargin == 1
    min_objnum = 10;
end

[row column byte] = size(image);

re_image = image;

maskimage = zeros(row,column);
maskimage = maskimage + 255;

stack_point = fgimage2point(image);

[stack_row stack_column] = size(stack_point);

recordimage = zeros(row,column);

re_rect = [];

for i = 1:stack_row
    pos_r = stack_point(i,1);
    pos_c = stack_point(i,2);
    
    [tempimage obj_left obj_top obj_right obj_bottom obj_count] = getObjByFg(image,maskimage,pos_r,pos_c);
    
    if obj_count > min_objnum
        recordimage = recordimage + tempimage;
        maskimage = abs(recordimage - 255);
        re_rect = [re_rect; obj_left obj_top obj_right obj_bottom];
    end
end
