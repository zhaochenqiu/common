function [files data] = loadData_plus(path,extention)

% ��������:
%    �������:
%        path       ͼ��·��
%        extention  ͼ���ʽ
%
%    �������:
%        data       ������ͼ�����ݾ������ݸ�ʽΪ imgsize * imgdeep * framenum 
%                   ͼ�����ݳ��ȣ�һά�� * ͼ����ȣ�rgb�� * ͼ��֡��
%
%    ȫ�ֲ���:
%        g_height   ͼ��ĸ�
%        g_width    ͼ��Ŀ�
%        g_imgdeep  ͼ������

global g_height g_width g_imgdeep

if(path(end) ~= '/')
    path = [path '/'];
end

fprintf(1, 'Loading files from %s...\n', path);

files = dir([path '*.' extention]);
files = sort({files.name});

frames = size(files, 2);

% Number of frames
% �ļ�������,��ϸ�ο�files���ļ���ʽ

data = files;

for tt = 1:frames
    fprintf(1, 'Reading file %d: %s\r', tt, files{tt});
    data{tt} = [path files{tt}];
end

