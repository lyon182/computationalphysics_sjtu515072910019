% Function: to determine the underflow and overflow 
% ¿Ó—Ù 515072910019

%% Initializing
clear all;clc;
under = 1;
over = 1;
i=0; j=0;
%% to find the overflow
while i<=1749 % 1749 is determined by test
    over=over*1.5;
    i=i+1;
end
disp(['the value of overflow is ',num2str(over)])
%% to find the underflow
while j<=9999999 
    under = under/1.5;
    j=j+1;
end
disp(['the value of underflow is ',num2str(under)])
