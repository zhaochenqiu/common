clear all
close all
clc

addpath('../../common/');
addpath('../');

global g_displayMatrixImage
g_displayMatrixImage = 1;

image1 = double(imread('../../data/in000001.jpg'));
image2 = double(imread('../../data/in000101.jpg'));
image3 = double(imread('../../data/in000301.jpg'));
image4 = double(imread('../../data/in000901.jpg'));

[row1 column1 byte1] = size(image1);
[row2 column2 byte2] = size(image2);
[row3 column3 byte3] = size(image3);
[row4 column4 byte4] = size(image4);

mask1 = zeros(row1,column1) + 255;
mask2 = zeros(row2,column2) + 255;
mask3 = zeros(row3,column3) + 255;
mask4 = zeros(row4,column4) + 255;

figure
displayMatrixImage(1,1,4,image1,image2,image3,image4);

hist1 = getHistogram_native(image1(:,:,1),mask1,2,255);
hist2 = getHistogram_native(image2(:,:,1),mask2,2,255);
hist3 = getHistogram_native(image3(:,:,1),mask3,2,255);
hist4 = getHistogram_native(image4(:,:,1),mask4,2,255);

histimg1 = histogram2image(hist1);
histimg2 = histogram2image(hist2);
histimg3 = histogram2image(hist3);
histimg4 = histogram2image(hist4);

[row_hist1 column_hist1] = size(hist1);
[row_hist2 column_hist2] = size(hist2);
[row_hist3 column_hist3] = size(hist3);
[row_hist4 column_hist4] = size(hist4);

num = 8;
length1 = round(column_hist1/num);
length2 = round(column_hist2/num);
length3 = round(column_hist3/num);
length4 = round(column_hist4/num);

mark1 = findPeak_plus(hist1,length1);
mark2 = findPeak_plus(hist2,length2);
mark3 = findPeak_plus(hist3,length3);
mark4 = findPeak_plus(hist4,length4);

color = [255 0 0
		180 180 180
		0 255 0];

fgcolor = [100 101 140];

tempimg1 = histogram2image_temp(mark1,color);
tempimg2 = histogram2image_temp(mark2,color);
tempimg3 = histogram2image_temp(mark3,color);
tempimg4 = histogram2image_temp(mark4,color);

histimg_plus1 = histogram2image_plus(hist1,mark1,fgcolor,color);
histimg_plus2 = histogram2image_plus(hist2,mark2,fgcolor,color);
histimg_plus3 = histogram2image_plus(hist3,mark3,fgcolor,color);
histimg_plus4 = histogram2image_plus(hist4,mark4,fgcolor,color);

g_displayMatrixImage = 1;

figure
displayMatrixImage(1,3,4,histimg1,histimg2,histimg3,histimg4,tempimg1,tempimg2,tempimg3,tempimg4,histimg_plus1,histimg_plus2,histimg_plus3,histimg_plus4);
