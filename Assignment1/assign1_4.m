% Function: to determine your machine precision for single-precision
% floats and double-precision floats.
% ¿Ó—Ù 515072910019
clear all;clc;
%% For single precision 
eps1=single(1.0);
while 1+eps1~=1
    eps1=eps1/2;
end
disp(['machine precision for single-precision is ',num2str(eps1)])

%% For double precision
eps2=1.0;
while 1+eps2~=1
    eps2=eps2/2;
end
disp(['machine precision for double-precision is ',num2str(eps2)])