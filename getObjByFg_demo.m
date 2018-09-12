clear all
close all
clc

addpath('../common/');

image = imread('bin000100.png');

image = image(:,:,1);

[row column byte] = size(image);

maskimage = zeros(row,column);
maskimage = maskimage + 255;

figure
imshow(uint8(image))

stack_point = fgimage2point(image);

[stack_row stack_column] = size(stack_point);

recordimage = zeros(row,column);

for i = 1:stack_row
    i
    pos_r = stack_point(i,1);
    pos_c = stack_point(i,2);
    
    [tempimage obj_left obj_top obj_right obj_bottom obj_count] = getObjByFg(image,maskimage,pos_r,pos_c);
    
    if obj_count > 10
        recordimage = recordimage + tempimage;
        maskimage = abs(recordimage - 255);

        displayImage(i,recordimage)
    end
    
    
end



