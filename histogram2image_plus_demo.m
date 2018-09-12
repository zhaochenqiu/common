clear all
close all
clc

addpath('../../common/');
addpath('../');

global g_displayMatrixImage
g_displayMatrixImage = 1;

image = double(imread('../../data/in000301.jpg'));


[row column byte] = size(image);

mask = zeros(row,column) + 255;

hist = getHistogram_native(image(:,:,1),mask,2,255);


[row_hist column_hist] = size(hist);

num = 8;
length = round(column_hist/num);

mark = findPeak_plus(hist,length);

fgcolor = [100 101 140];

color = [255 0 0
		180 180 180
		0 0 255
		240 70 240];

[scale1 histimg1] = histogram2image_plus(hist);

[scale2 histimg2] = histogram2image_plus(hist,fgcolor);

[scale3 histimg3] = histogram2image_plus(hist,fgcolor,mark

[scale4 histimg4] = histogram2image_plus(hist,fgcolor,mark,color);

[scale5 histimg5] = histogram2image_plus(hist,fgcolor,mark,color,0.1);



figure
displayMatrixImage(1,1,5,histimg1,histimg2,histimg3,histimg4,histimg5);
