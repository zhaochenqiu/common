function [] = displayResult(frames,image1,image2)
% Author:Q
% Date:2013/12/31
% Describe:显示高斯混合模型的结果

% 参数解释:
%    输入参数:
%        framenum       图像的帧数，表示现在是第几帧图像，最后会被显示在图像的左上角
%        image          当前图像
%        foreground_img 前景图像
%        background_img 背景图像，因为有多个背景，所以其实是最佳背景
%
%    输出参数:

% 此时matlab坐标原点在左下角
% 这个坐标还有问题，以后改吧

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
