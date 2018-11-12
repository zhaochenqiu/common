function re_pos = img2pos(img)

% return the (x,y) instead of (row,column)


[row column byte] = size(img);


xline = 1:column;
yline = 1:row;


re_pos = zeros(row, column, 2);

for i = 1:row
    re_pos( i, :, 1) = xline;
end

for i = 1:column
    re_pos( :, i, 2) = yline;
end
