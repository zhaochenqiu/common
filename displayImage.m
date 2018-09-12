function [] = displayImage(frames,image)

global g_judge

if g_judge == 1
    set (gcf,'Position',[100 100 1200 500], 'color','w')
    g_judge = 0;
end

set(gca, 'Units', 'normalized')
imshow(uint8(image));
framestr = sprintf('%04d', frames);
text(10, 10, framestr, 'Color', 'r', 'Fontsize', 15);
hold on; axis ij; axis off;
hold off;

drawnow;
