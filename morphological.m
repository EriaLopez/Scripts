addpath('C:\Users\Dr Ulises Moya\Documents\OCTAVE\private')
clear all; close all;
I2 =(imread("coins.png"));
Z2=im2bw(I2,.5);

se = [1, 1, 1;  1, 1, 1; 1, 1, 1];

%B = imdilate(Z2, se);  
B=filter2(se,Z2)>0;
%D = imerode(Z2, se); 
thr = sum(se(:)) D= filter2(se,Z2) == thr;


figure;
subplot(141);imshow(I2,[ ]), 
subplot(142); imshow(double(Z2),[0,1])
subplot(143); imshow(double(B),[0,1])
subplot(144); imshow(double(D),[0,1])
%subplot(143); image(R(:,1),R(1,:))

