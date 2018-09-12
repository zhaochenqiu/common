function re_judge = ifNameMatch(filename,truthname,pos)

if nargin == 2
	pos = find(filename == '.');
end
pos = pos - 1;

filename = filename(1:pos);

truthname = truthname(1:pos);

re_judge = 0;


if filename == truthname
	re_judge = 1;
end
