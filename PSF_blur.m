I = imread('C:\Users\Carmina\Documents\Master\ProcesamientoDeImagenes\stone.jpg');
figure; imshow(I); title('Original Image');
LEN = 31; % length of blur
THETA = 11; % angle of blur
PSF = fspecial('motion',LEN,THETA); %create PSF
Blurred = imfilter(I,PSF,'circular','conv'); %blur
figure; imshow(Blurred);title('Blurred Image');
figure;
imshow(imabsdiff(I,Blurred)); % difference