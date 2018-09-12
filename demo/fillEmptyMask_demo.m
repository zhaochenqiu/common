clear all
close all
clc

image = double(imread('../data/test3.bmp'));

figure
imshow(uint8(image))

[row column byte] = size(image);

maskimage = zeros(row,column);

tempimage = image(:,:,1);

index = tempimage == 0;
index = ~index;

maskimage(index) = 255;

figure
imshow(uint8(maskimage))

fillmask = fillEmptyMask(maskimage);

figure
imshow(uint8(fillmask))