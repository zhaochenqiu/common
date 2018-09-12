close all
clc

global g_displayMatrixImage

g_displayMatrixImage = 1;

addpath('../common/');

path = 'D:\dataset\dataset\baseline\highway\input';
format = 'jpg';

%data = loadData(path,format);

[imgsize imgdeep byte framenum] = size(data);

for i = 1:framenum
    fprintf(1,'Evaluating frame %d.... \n',i);
    
    image = data(:,:,:,i);
    
    displayMatrixImage(i,2,2,image,image,image,image);
end