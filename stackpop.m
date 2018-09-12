function [re_stack element] = stackpop(stack)

[row column] = size(stack);

if row == 1
    element = stack;
    re_stack = [];
else
    element =stack(1,:);
    re_stack = stack(2:row,:);
end