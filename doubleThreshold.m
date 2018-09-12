function [re_tempbimage]= doubleThreshold(image,topv,bottomv,radius)

timage = image;
bimage = image;

index_matrch = timage > topv;
index_unmatch = ~index_matrch;
timage(index_matrch) = 255;
timage(index_unmatch) = 0;
temptimage = timage;

index_matrch = bimage > bottomv;
index_unmatch = ~index_matrch;
bimage(index_matrch) = 255;
bimage(index_unmatch) = 0;
tempbimage = bimage;

[row column num] = size(timage);

for i = (radius + 1):(row - radius)
    for j = (radius + 1):(column - radius)
        if timage(i,j,1) == 255
            for r = (i - radius):(i + radius)
                for c = (j - radius):(j + radius)
                    for q = 1:num
                        temptimage(r,c,q) = 255;
                    end
                end
            end
        end
    end
end

for i = 1:row
    for j = 1:column
        if bimage(i,j,1) == 255 & temptimage(i,j,1) == 255
            for q = 1:num
                tempbimage(i,j,q) = 255;
            end
        else
            for q = 1:num
                tempbimage(i,j,q) = 0;
            end
        end
    end
end

re_tempbimage = tempbimage;
