function [] = showSchedule(pos,length,str)

if nargin == 2
	str = 'unknow';
end

value = pos/length;
str = sprintf('%s:%i -- %2.2f%%',str,pos, value*100);
disp(str);
