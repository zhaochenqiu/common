function re_matrix = getEva_CDNet(datamatrix)

[row column] = size(datamatrix);

re_matrix = [];

for i = 1:row
    data = datamatrix(i,:);

    TP = data(1);
    FP = data(2);
    FN = data(3);
    TN = data(4);

    re = TP / (TP + FN);
    pr = TP / (TP + FP);

    Precision = pr;
    Recall = re;

    fm = (2 * Precision * Recall) / (Precision + Recall);

    re_matrix = [re_matrix ; re pr fm];
end
