function [re_path re_files] = getDirFile(path,format)

if(path(end) ~= '/')
    path = [path '/'];
end

files = dir([path '*.' format]);
files = sort({files.name});

re_files = files;
re_path = path;