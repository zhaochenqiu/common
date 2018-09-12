clear all
close all
clc

addpath('../../common/');
addpath('../');

global g_displayMatrixImage
g_displayMatrixImage = 1;

image1 = double(imread('../../data/in000001.jpg'));
image2 = double(imread('../../data/in000301.jpg'));

[row1 column1 byte1] = size(image1);
[row2 column2 byte2] = size(image2);

mask1 = zeros(row1,column1) + 255;
mask2 = zeros(row2,column2) + 255;

hist1 = getHistogram_native(image1(:,:,1),mask1,2,255);
hist2 = getHistogram_native(image2(:,:,1),mask2,2,255);

histimg1 = histogram2image(hist1);
histimg2 = histogram2image(hist2);

[row_hist1 column_hist1] = size(hist1);
[row_hist2 column_hist2] = size(hist2);

num = 8;

length1 = round(column_hist1/num);
length2 = round(column_hist2/num);

mark1 = findPeak_plus(hist1,length1);
mark2 = findPeak_plus(hist2,length2);

color = [	255 0 0
			180 180 180
			0 0 255
			240 70 240];

fgcolor = [100 101 140];

[scale1 histimg_plus1] = histogram2image_plus(hist1,mark1,fgcolor,color);
[scale2 histimg_plus2] = histogram2image_plus(hist2,mark2,fgcolor,color);

figure
displayMatrixImage(1,2,2,histimg1,histimg2,histimg_plus1,histimg_plus2);

subhist = abs(hist1 - hist2);

subhistimg = histogram2image(subhist);

figure
imshow(uint8(subhistimg));

mean(hist1)
max(hist1)

mean(hist2)
max(hist2)

mean(subhist)
max(subhist)


