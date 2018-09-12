function [re_vector re_value] = siltpEle(matrix,para)

compare = matrix(2,2);
minvalue = compare * (1 - para);
maxvalue = compare * (1 + para);

vector = [];

if matrix(1,2) > maxvalue
    vector = [vector 1 0];
elseif matrix(1,2) < minvalue
    vector = [vector 0 1];
else
    vector = [vector 0 0];
end

if matrix(2,1) > maxvalue
    vector = [vector 1 0];
elseif matrix(1,2) < minvalue
    vector = [vector 0 1];
else
    vector = [vector 0 0];
end

if matrix(2,3) > maxvalue
    vector = [vector 1 0];
elseif matrix(1,2) < minvalue
    vector = [vector 0 1];
else
    vector = [vector 0 0];
end

if matrix(3,1) > maxvalue
    vector = [vector 1 0];
elseif matrix(1,2) < minvalue
    vector = [vector 0 1];
else
    vector = [vector 0 0];
end

re_value = calcBinary(vector);
%re_value = sum(vector) * 20;
re_vector = vector;