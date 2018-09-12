clear all
close all
clc

global g_displayMatrixImage
g_displayMatrixImage = 1;
addpath('../common/')
image = double(imread('../data/in000001_sub.jpg'));

figure
imshow(uint8(image))

image_mode = image;

image_mode_old = image;

num = 100;

for i = 1:num
    image_mode = filter_mode(image_mode);
    subimage = image_mode_old - image_mode;
    thresholimage = thresholdImage(subimage,0);
    image_mode_old = image_mode;
    displayMatrixImage(i,1,4,image,image_mode,subimage,thresholimage);
    input('pause')
end

figure
imshow(uint8(image_mode))