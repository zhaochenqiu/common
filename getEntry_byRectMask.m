function re_entry = getEntry_byRectMask(template,mask,rect)

[row column byte] = size(template);

left	= rect(1);
top		= rect(2);
right	= rect(3);
bottom	= rect(4);

tempmask = mask(:,:,1);
index = tempmask == 255;
index = ~index;

re_entry = template(top:bottom,left:right,:);

for i = 1:byte
	tempimage = re_entry(:,:,i);
	tempimage(index) = 0;

	re_entry(:,:,i) = tempimage;
end
