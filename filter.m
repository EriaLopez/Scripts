A = imread('C:\Users\Carmina\Documents\Master\ProcesamientoDeImagenes\tour_512size.jpg');   
A = rgb2gray(A);
FT = fft2(A);
FT_centered = fftshift(FT);
subplot(2,3,1); imshow(A);
subplot(2,3,2); imshow(log(1+abs(FT)),[ ]);     %Display FT modulus (log scale)
subplot(2,3,3); imshow(log(1+abs(FT_centered)),[ ]);   %Display centered FT modulus (log scale)

[xd,yd] = size(A);
x = -xd./2:xd./2-1  ;
y = -yd./2:yd./2-1  ;
[X,Y] = meshgrid(x,y); 
sigma = 150;
arg = (X.^2 + Y.^2)./sigma.^2;                  %Construct freq domain filter
frqfilt = exp(arg);
imfilt1 = abs(ifft2(frqfilt.*FT));               %Centered filter and non centered spectrum
imfilt2 = abs(ifft2(frqfilt.*FT_centered));     %image centered filter on centered spectrum
subplot(2,3,4);imshow(imfilt1, [ ]);
subplot(2,3,5);imshow(imfilt2, [ ]);
