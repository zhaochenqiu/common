function re_fgimg = tru2fg_fbms_PROB(img,maskimg)

tempimg = sum(img,3);
tempmsk = sum(maskimg,3);

[row_img column_img byte_img] = size(img);

re_fgimg = zeros(row_img,column_img);

index = tempimg == 765;
re_fgimg(index) = 0;
index = ~index;
re_fgimg(index) = 255;

index = tempmsk == 255;
index = ~index;
re_fgimg(index) = 100;


