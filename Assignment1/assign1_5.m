% Function: calculate the value of ¦Ð by using n terms of the series and
% calculate the corresponding true relative error
% ÀîÑô 515072910019
clear all;
clc;
n=input('please enter an even positive number: ');
j=n/2;s=0;
%%  sum the series
while j>=1
    s=s+2/((4*j-3)*(4*j-1));
    j=j-1;
end
s=4*s;
rr=((s-pi)/pi);
disp(['the value of ¦Ð by using n terms of the series is ',num2str(s)])
disp(['the relative error is ',num2str(rr)])