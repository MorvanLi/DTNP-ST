% ---------
% Author: Bo Li 2020.1    <morvanli@foxmail.com>    
%=============================================================
%%
clc;
close all;
clear all;
%%
addpath(genpath(cd));
%%
[imagename1, imagepath1]=uigetfile('images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
image1=imread(strcat(imagepath1,imagename1)); 
[imagename2,imagepath2]=uigetfile('images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image'); 
image2=imread(strcat(imagepath2,imagename2)); 

ori_A = double(image1)/255;
ori_B = double(image2)/255;
if size(ori_A, 3) > 1
    flag = 1;
else
    flag = 0;
end
if size(image1,3)>1
    image1 = rgb2gray(image1);
    image2 = rgb2gray(image2);
end
A=double(image1)/255;
B=double(image2)/255;

%% We will have 2^(L+1) different directional subbands at each scale
L = 3;

%% We show surfacelets at the scale at "iScale".
iScale = 3;

%% The order of the checkerboard filter banks. The higher bo is, the
%% sharper the frequency response is.
bo = 12; 

%% Resolution of the frequency plot
K = 64;
Lev_array = cell(1, iScale);

for i = 1 : iScale - 1
    Lev_array{i} = [-1 0; 0 -1];
end
Lev_array{iScale} = [-1 0; 0 -1];

Pyr_mode = 1;


%% Surfacelet Decomposition
tic
[Ya, Recinfo] = Surfdec(A, Pyr_mode, Lev_array, 'ritf', 'bo', bo);
[Yb, Recinfo] = Surfdec(B, Pyr_mode, Lev_array, 'ritf', 'bo', bo);
n = length(Ya);
Fused=Ya;
disp('Process in Lowpass subband...')
ALow1= Ya{4};
BLow1 =Yb{4};
Fused{4} = Low_fusion(ALow1,BLow1);
d = 1;

for l = 1:n-1
    for r = 1:length(Ya{l}) 
        Ahigh = Ya{l}{r}{d};
        Bhigh = Yb{l}{r}{d};
        Fused{l}{r}{d} = high_fusion(Ahigh,Bhigh);
   
    end
end
disp('High frequecy field process is ended')
Rec = Surfrec(Fused, Recinfo);
toc

D =optimization(Rec,A,B, flag);
result = ori_A.*D+(1-D).*ori_B;
figure;imshow(uint8(result*255),[]);