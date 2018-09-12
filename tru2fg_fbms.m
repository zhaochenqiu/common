function re_fgimg = tru2fg_fbms(img)

tempimg = img(:,:,1);

[row_img column_img byte_img] = size(tempimg);

re_fgimg = zeros(row_img,column_img);

index = tempimg ~= 0;
re_fgimg(index) = 255;

