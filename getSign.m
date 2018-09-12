function re_label = getSign(value)

if value < 0
	re_label = -1;
elseif value == 0
	re_label = 0;
else
	re_label = 1;
end

