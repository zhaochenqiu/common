function re_fgimage = graythresh_plus(similarimg,rate) 

if nargin == 1
	rate = 1.6;
end

level = graythresh(uint8(similarimg));
templevel = level*rate;

re_fgimage = similarimg;
tempfg = templevel*255;

index = similarimg > tempfg;
re_fgimage(index) = 255;
index = ~index;
re_fgimage(index) = 0;


