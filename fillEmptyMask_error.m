function re_mask = fillEmptyMask_error(maskimage)

[row column byte] = size(maskimage);

tempmask = maskimage;

for i = 1:row
    for j = 1:column
        if tempmask(i,j) == 255
            break;
        end
        
        tempmask(i,j) = 100;
    end
end

for i = 1:row
    for j = 1:column
        pos = column - j + 1;
        
        if tempmask(i,pos) == 255
            break;
        end
        
        tempmask(i,pos) = 100;
    end
end

for j = 1:column
    for i = 1:row
        if tempmask(i,j) == 255
            break;
        end
        
        tempmask(i,j) = 100;
    end
end

for j = 1:column
    for i = 1:row
        pos = row - i + 1;
        
        if tempmask(pos,j) == 255
            break;
        end
        
        tempmask(pos,j) = 100;
    end
end

index = tempmask == 100;
tempmask(index) = 0;

index = ~index;
tempmask(index) = 255;

re_mask = tempmask;