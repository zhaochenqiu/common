function re_index = findPeak_BoundaryCondition(index)

[row column] = size(index);

re_index = index;

re_index(1) = 1;
re_index(column) = 1;
