function re_im = getFigIm(color)

F = getframe(gcf);
im = F.cdata;

% imwrite(F.cdata,'lightflow.png');

[row_f column_f byte_f] = size(im);

assert(byte_f == 3,'error: the byte of figure must be 3');



index_r = im(:,round(column_f/2),1) ~= color(1);
index_g = im(:,round(column_f/2),2) ~= color(2);
index_b = im(:,round(column_f/2),3) ~= color(3);

index_row = find((index_r&index_g&index_b) == 1);
top     = index_row(1);
bottom  = index_row(end);


index_r = im(round(row_f/2), : ,1) ~= color(1);
index_g = im(round(row_f/2), : ,2) ~= color(2);
index_b = im(round(row_f/2), : ,3) ~= color(3);

index_row = find((index_r&index_g&index_b) == 1);
left    = index_row(1);
right   = index_row(end);

re_im = im(top:bottom,left:right,:);


