clear all
close all
clc

addpath('../../common');
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

subhist = abs(hist1 - hist2);

num = 8;

[row_hist1 column_hist1] = size(hist1);
[row_hist2 column_hist2] = size(hist2);

length1 = round(column_hist1/num);
length2 = round(column_hist2/num);

mark1 = findPeak_plus(hist1,length1);
mark2 = findPeak_plus(hist2,length2);

fgcolor = [100 101 140];

color = [	255	0	0
			188 188 188
			0 0 255
			240 70 240];

[scale1 histimg1] = histogram2image_plus(hist1,fgcolor,mark1,color);
[scale2 histimg2] = histogram2image_plus(hist2,fgcolor,mark2,color);

scale_avg = (scale1 + scale2)/2;

[scale_sub histimg_sub] = histogram2image_plus(subhist,fgcolor,mark1,color,scale_avg);

figure
displayMatrixImage(1,1,3,histimg1,histimg2,histimg_sub);


