clear all
close all
clc

global g_displayMatrixImage
g_displayMatrixImage = 1;

image = double(imread('../data/test2.bmp'));

figure
imshow(uint8(image))

image_median = image;

image_median_old = image;

num = 100;

figure
for i = 1:num
    image_median = filter_median(image_median);
    subimage = image_median_old - image_median;
    thresholdimage = thresholdImage(subimage,0);
    displayMatrixImage(1,1,4,image,image_median,subimage,thresholdimage);
    
    input('pause')
end