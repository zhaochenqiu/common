function re_maskimage = floodFill(image,start_r,start_c)

% �����ǲ�����������Ϊ̫�鷳
% re_image ���Ǻڵף���ͼ����䲿�־��ǰ�ɫ

[row column byte] = size(image);

fgcolor = image(start_r,start_c,:);

re_maskimage = zeros(row,column,byte);

stack = [start_r start_c];

loopjudge = 0;

while loopjudge == 0
    [stack element] = stackpop(stack);
    
    pos_r = element(1);
    pos_c = element(2);
    
    if re_maskimage(pos_r,pos_c,1) == 0 & image(pos_r,pos_c,:) == fgcolor
        re_maskimage(pos_r,pos_c,:) = 255;
        
        if pos_r - 1 > 0 
            if re_maskimage(pos_r - 1,pos_c,1) == 0
                stack = stackpush(stack,[pos_r - 1 pos_c]);
            end
        end
        
        if pos_r + 1 < row + 1
            if re_maskimage(pos_r + 1,pos_c,1) == 0
                stack = stackpush(stack,[pos_r + 1 pos_c]);
            end
        end
        
        if pos_c - 1 > 0
            if re_maskimage(pos_r,pos_c - 1,1) == 0
                stack = stackpush(stack,[pos_r pos_c - 1]);
            end
        end
        
        if pos_c + 1 < column + 1
            if re_maskimage(pos_r,pos_c + 1,1) == 0
                stack = stackpush(stack,[pos_r pos_c + 1]);
            end
        end
    end
    
    [row_stack column_stack] = size(stack);
    row_stack
    if row_stack == 0 & column_stack == 0
        loopjudge = 1;
    end
end
