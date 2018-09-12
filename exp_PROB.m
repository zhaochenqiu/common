clear all
close all
clc

addpath('../../../common');
addpath('../../');
addpath('../');


threshold_fg = 0.4;
avg_all = [];
avg_nor = [];

path_sim = 'D:\dataset\detection_msd\Testset\camel01\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\camel01\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of camel01');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];










path_sim = 'D:\dataset\temp\detection_msd\Testset\dogs01\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\dogs01\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of dogs01');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];



path_sim = 'D:\dataset\temp\detection_msd\Testset\dogs02\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\dogs02\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of dogs02');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];





path_sim = 'D:\dataset\temp\detection_msd\Testset\cats01\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\cats01\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of cats01');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];


path_sim = 'D:\dataset\temp\detection_msd\Testset\cats03\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\cats03\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of cats03');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];




path_sim = 'D:\dataset\temp\detection_msd\Testset\cats06\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\cats06\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of cats06');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];




path_sim = 'D:\dataset\temp\detection_msd\Testset\horses02\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\horses02\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of horses02');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];





path_sim = 'D:\dataset\temp\detection_msd\Testset\horses04\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\horses04\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of horses04');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];





path_sim = 'D:\dataset\temp\detection_msd\Testset\horses05\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\horses05\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of horses05');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];







path_sim = 'D:\dataset\temp\detection_msd\Testset\goats01\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\goats01\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of goats01');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];




path_sim = 'D:\dataset\temp\detection_msd\Testset\farm01\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\farm01\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of farm01');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];





path_sim = 'D:\dataset\temp\detection_msd\Testset\giraffes01\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\giraffes01\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of giraffes01');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];





path_sim = 'D:\dataset\temp\detection_msd\Testset\lion01\segment';
format_sim = 'png';


path_tru = 'D:\dataset\FBMS_Testset\Testset\lion01\GroundTruth';
path_msk = path_tru;
format_tru = 'ppm';
format_msk = 'pgm';


[files_sim data_sim] = loadData_plus(path_sim,format_sim);
[files_tru data_tru] = loadData_plus(path_tru,format_tru);
[files_msk data_msk] = loadData_plus(path_msk,format_msk);

[files_tru data_tru] = truFilter_PROB(files_tru,data_tru);


[re_allentry re_norentry re_allvalue re_norvalue] = evaluate_fbms_PROB(files_sim,data_sim,data_tru,files_msk,data_msk,threshold_fg);

disp('the result of lion01');
re_allvalue
re_norvalue
avg_all = [avg_all re_allvalue(2)];
avg_nor = [avg_nor re_norvalue(2)];





avg_all
avg_nor

mean(avg_all)
mean(avg_nor)
