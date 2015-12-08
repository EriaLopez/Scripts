a = (imread('C:\Users\Carmina\Documents\Master\ProcesamientoDeImagenes\Primary-Color-Scheme.jpg'));

hsv = rgb2hsv(a);
h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);
figure('Name','H');imshow(h);title('H');
figure;imshow(s);title('S');
figure;imshow(v);title('V');