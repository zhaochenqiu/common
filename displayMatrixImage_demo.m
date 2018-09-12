clear all
close all
clc

global g_displayMatrixImage
g_displayMatrixImage = 1

image = imread('dataset/floodfill_test.bmp');

figure
imshow(uint8(image))

for i = 1:100
    displayMatrixImage(i,2,3,image,image,image,image,image,image);
end



figure
displayMatrixImage(9,2,2,image,image,image,image);