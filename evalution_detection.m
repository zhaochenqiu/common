function [Re Sp Pr F_m evajudge] = evalution_detection(fgimage,truth)

fgP_index = fgimage == 255;
fgN_index = fgimage == 0;

trP_index = truth == 255;
trN_index = truth == 0;

index = fgP_index & trP_index;
TP = sum(sum(index));

index = fgP_index & trN_index;
FP = sum(sum(index));

index = fgN_index & trN_index;
TN = sum(sum(index));

index = fgN_index & trP_index;
FN = sum(sum(index));

list = [TP FP TN FN];

if TP == 0 | FP == 0 
	evajudge = -1;
	Re = -1;
	Sp = -1;
	Pr = -1;
	F_m = -1;
else
	evajudge = 0;
	sumvalue = TP + FN;
	if sumvalue == 0
		disp('error: in the evalution_detection the TP + FN = 0');
		sumvalue = -1;
	end
	Re = TP/sumvalue;

	sumvalue = TN + FP;
	if sumvalue == 0
		disp('error: in the evalution_detection the TN + FP = 0');
		sumvalue = -1;
	end
	Sp = TN/sumvalue;

	sumvalue = TP + FP;
	if sumvalue == 0
		disp('error: in the evalution_detection the TP + FP = 0');
		sumvalue = -1;
	end
	Pr = TP/sumvalue;

	sumvalue = Pr + Re;
	if sumvalue == 0
		disp('error: in the evalution_detection the Pr + Re = 0');
		sumvalue = -1;
	end
	F_m = (2 * Pr * Re)/sumvalue;
end



