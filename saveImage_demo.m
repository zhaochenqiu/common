clear all
close all
clc

image = double(imread('D:/dataset/FBMS_Testset/Testset/tennis/tennis454.jpg'));

figure
imshow(uint8(image))

saveImage(image,'..\test\test2\test3\','test.jpg');
