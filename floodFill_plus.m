function re_maskimage = floodFill_plus(image,start_r,start_c)

% floodFill的加速版本,index 加速
% 快乐一些，但还是有点慢，将就着用吧

[row column byte] = size(image);

fgcolor = image(start_r,start_c,:);

re_maskimage = zeros(row,column);

stack = [start_r start_c];

loopjudge = 0;

index_mask = re_maskimage == 0;

index_image = image(:,:,1) == fgcolor(1);
for i = 1:byte
    tempindex = image(:,:,i) == fgcolor(i);
    index_image = index_image & tempindex;
end

index_judge = index_mask & index_image;

index_stack = zeros(row,column);

while loopjudge == 0
    stack_index = floodFill_plus_fillindex(re_maskimage,stack);
    
    re_maskimage(stack_index) = 255;
    index_judge(stack_index) = 0;
    
    stack = floodFill_plus_pushstack(image,stack);

    tempindex = sub2ind([row column],stack(:,1),stack(:,2));
    index_stack(tempindex) = 1;
    index_stack = logical(index_stack);
    
    index = index_judge & index_stack;
    
    [pos_r pos_c] = find(index == 1);
    stack = [pos_r pos_c];

    [row_stack column_stack] = size(stack);
    if row_stack == 0
        loopjudge = 1;
    end
end
