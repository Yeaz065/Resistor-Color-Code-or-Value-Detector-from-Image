%% controls the whole programme with the help of other scripts
%%Seperating each resistor from the main image
Iinput=imread(imageres);
run('res_segmentation.m');
%%Determining the value of each resistor and show the output
run('finding_value.m');
clear all;