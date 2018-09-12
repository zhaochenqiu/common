clear all
close all
clc

addpath('../');

image = double(imread('../dataset/floodfill_test.bmp'));

figure
imshow(uint8(image));

% 6 �����Ե�.
% 1-4 �ĸ���Բ (row column)-(100,120),(80,460),(260,180),(270,380)
% 5 ���� (row,column)-(10,10)
% 6 ��Բ�� (row,column)-(75,100)

time = clock;

fillimage = floodFill_plus(image,100,120);
figure
imshow(uint8(fillimage));

etime(clock,time)
time = clock;

fillimage = floodFill_plus(image,80,460);
figure
imshow(uint8(fillimage));

etime(clock,time)
time = clock;

fillimage = floodFill_plus(image,280,200);
figure
imshow(uint8(fillimage));

etime(clock,time)
time = clock;

fillimage = floodFill_plus(image,270,380);
figure
imshow(uint8(fillimage));

etime(clock,time)
time = clock;

fillimage = floodFill_plus(image,10,10);
figure
imshow(uint8(fillimage));

etime(clock,time)
time = clock;

fillimage = floodFill_plus(image,75,100);
figure
imshow(uint8(fillimage));

etime(clock,time)