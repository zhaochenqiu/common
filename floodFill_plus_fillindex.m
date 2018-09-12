function re_index = floodFill_plus_fillindex(image,stack)

[row column byte] = size(image);

stackindex = sub2ind([row column],stack(:,1),stack(:,2));
tempindex1 = zeros(row,column);
tempindex1(stackindex) = 1;
tempindex1 = logical(tempindex1);

tempindex2 = image(:,:,1) == 0;


re_index = tempindex1 & tempindex2;