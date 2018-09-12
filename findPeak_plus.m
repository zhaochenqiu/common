function re_mark = findPeak_plus(histogram,range)

[row column] = size(histogram);

tempmark = zeros(1,column);

expandlength = round(range/2) + 1;

expandleft	= zeros(1,expandlength);
expandright = zeros(1,expandlength);

dealhistogram = histogram;

dealhistogram = [expandleft dealhistogram];
dealhistogram = [dealhistogram expandright];

dealmark = tempmark;
dealmark = [expandleft dealmark];
dealmark = [dealmark expandright];

window_left = 1;
window_right = window_left + range;

meanhist = mean(histogram);
minhist = meanhist*0.4;


[row_deal column_deal] = size(dealhistogram);

for i = 1:column_deal - range
	pos = round((window_left + window_right)/2);

	tempmax = max(dealhistogram(window_left:window_right));
	tempmax = tempmax(1);

	if dealhistogram(pos) == tempmax

		if dealhistogram(pos) == 0
			dealmark(pos) = 4;
		else
			if dealhistogram(pos) < minhist
				dealmark(pos) = 3;
			else
				dealmark(pos) = 1;
			end
		end
		
		dealmark(window_left) = 2;
		dealmark(window_right) = 2;
	end

	window_left = window_left + 1;
	window_right = window_right + 1;
end

pos_left = expandlength + 1;
pos_right = column_deal - expandlength;

re_mark = dealmark(pos_left:pos_right);
