function [] = displayResult(frames,image1,image2)
% Author:Q
% Date:2013/12/31
% Describe:��ʾ��˹���ģ�͵Ľ��

% ��������:
%    �������:
%        framenum       ͼ���֡������ʾ�����ǵڼ�֡ͼ�����ᱻ��ʾ��ͼ������Ͻ�
%        image          ��ǰͼ��
%        foreground_img ǰ��ͼ��
%        background_img ����ͼ����Ϊ�ж��������������ʵ����ѱ���
%
%    �������:

% ��ʱmatlab����ԭ�������½�
% ������껹�����⣬�Ժ�İ�

% set (gcf,'Position',[100 300 1200 300], 'color','w')
global g_judge

if g_judge == 1
    set (gcf,'Position',[100 100 1200 500], 'color','w')
    g_judge = 0;
end

subplot(1, 2, 1);
set(gca, 'Units', 'normalized', 'Position', [0 0.0 0.495 0.975])
imshow(uint8(image1));
framestr = sprintf('%04d', frames);
text(10, 10, framestr, 'Color', 'r', 'Fontsize', 15);
hold on; axis ij; axis off;
hold off;

subplot(1, 2, 2);
set(gca, 'Units', 'normalized', 'Position', [0.505 0.0 0.495 0.975])
imshow(uint8(image2));
framestr = sprintf('%04d', frames);
text(10, 10, framestr, 'Color', 'r', 'Fontsize', 15);
hold on; axis ij; axis off;
hold off;


drawnow;
