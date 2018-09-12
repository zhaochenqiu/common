function re_stack = floodFill_plus_pushstack(image,stack)

% 没写好，没法反向修正stack坐标

[row column byte] = size(image);

stack_left = stack;
stack_right = stack;
stack_top = stack;
stack_bottom = stack;

stack_left(:,2) = stack_left(:,2) - 1;
stack_right(:,2) = stack_right(:,2) + 1;

stack_top(:,1) = stack_top(:,1) - 1;
stack_bottom(:,1) = stack_bottom(:,1) + 1;

re_stack = [];

index_stack = stack_left(:,2) > 0;
tempstack = stack_left(index_stack,:);
re_stack = [re_stack ; tempstack];

index_stack = stack_right(:,2) < column + 1;
tempstack = stack_right(index_stack,:);
re_stack = [re_stack ; tempstack];

index_stack = stack_top(:,1) > 0;
tempstack = stack_top(index_stack,:);
re_stack = [re_stack ; tempstack];

index_stack = stack_bottom(:,1) < row + 1;
tempstack = stack_bottom(index_stack,:);
re_stack = [re_stack ; tempstack];

