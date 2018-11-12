function re_im = visNPImg(im)

[row_im column_im byte_im] = size(im);

re_im = zeros(row_im, column_im, 3);

posim = im;
negim = im;

posim(posim < 0) = 0;
negim(negim > 0) = 0;
negim = abs(negim);

re_im(:, :, 1) = posim;
re_im(:, :, 2) = negim;
