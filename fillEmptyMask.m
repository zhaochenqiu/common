function re_mask = fillEmptyMask(maskimage)

[row column byte] = size(maskimage);

tempmask = maskimage;
tempvalue = 100;

re_mask = zeros(row,column);

pos = 1;
for i = 1:row
    if tempmask(i,pos) == 0
        fillimage = floodFill_plus(maskimage,i,pos);
        
        index = fillimage == 255;
        
        tempmask(index) = tempvalue;
    end
end

pos = column;
for i = 1:row
    if tempmask(i,pos) == 0
        fillimage = floodFill_plus(maskimage,i,pos);
        
        index = fillimage == 255;
        
        tempmask(index) = tempvalue;
    end
end

pos = 1;
for i = 1:column
    if tempmask(pos,i) == 0
        fillimage = floodFill_plus(maskimage,pos,i);
        
        index = fillimage == 255;
        
        tempmask(index) = tempvalue;
    end
end

pos = row;
for i = 1:column
    if tempmask(pos,i) == 0
        fillimage = floodFill_plus(maskimage,pos,i);
        
        index = fillimage == 255;
        
        tempmask(index) = tempvalue;
    end
end

index = tempmask == tempvalue;
index = ~index;

re_mask(index) = 255;