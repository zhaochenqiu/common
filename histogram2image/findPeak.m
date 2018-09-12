function re_peak = findPeak(histogram,range)

[row column] = size(histogram);

temppeak = zeros(1,column);

expandlength = round(range/2) + 1;

expandleft = zeros(1,expandlength);
expandright = zeros(1,expandlength);

dealhistogram = histogram;
dealhistogram = [expandleft dealhistogram];
dealhistogram = [dealhistogram expandright];

dealpeak = temppeak;
dealpeak = [expandleft dealpeak];
dealpeak = [dealpeak expandright];

window_left = 1;
window_right = window_left + range;

[deal_row deal_column] = size(dealhistogram);

for i = 1:deal_column - range
	pos = round((window_left + window_right)/2);

	tempvalue = max(dealhistogram(window_left:window_right));
	tempvalue = tempvalue(1);

	if dealhistogram(pos) == tempvalue
		dealpeak(pos) = 1;
	end

	window_left = window_left + 1;
	window_right = window_right + 1;
end

pos_left = expandlength + 1;
pos_right = deal_column - expandlength;

re_peak = dealpeak(pos_left:pos_right);
