function [] = pngClrWrite(img, color, name);

[row_im column_im byte_im] = size(img);

idxr = img(:, :, 1) == color(1);
idxg = img(:, :, 2) == color(2);
idxb = img(:, :, 3) == color(3);

idx = idxr & idxg & idxb;
idx = ~idx;

map = zeros(row_im, column_im);
map(idx) = 255;

imwrite(uint8(img), name, 'Alpha', map);
