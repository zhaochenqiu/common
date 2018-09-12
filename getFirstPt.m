function [r c ifget] = getFirstPt(image,startr,startc)

[row column num] = size(image);

judge1 = 0;
judge2 = 0;
i = startr;
j = startc;
ifget = 0;
r = 0;
c = 0;

while judge1 == 0
    judge2 = 0;
    j = 1;
    while judge2 == 0
        
        if image(i,j,1) == 255
            c = j;
            r = i;
            judge1 = 1;
            judge2 = 1;
            ifget = 1;
        end
        
        j = j + 1;
        if j == column + 1
            judge2 = 1;
        end
    end
    
    i = i + 1;
    if i == row + 1
        judge1 = 1;
    end
end
