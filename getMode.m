function re_value = getMode(matrix)

% 自己写的，有效率问题，所以直接调用matlab 自带的，封装一下

list = mode(matrix);

re_value = list(1); % 有多个时候只取第一个