clear;close all
im=imread('C:\Users\Carmina\Documents\Master\ProcesamientoDeImagenes\frida.jpg'); 
sz=size(im);
figure;imshow(im,[]);
 
for i=1:sz(1)
    for j=1:sz(2)
        if im(i,j,1)>100 & im(i,j,2)>100 & im(i,j,3)>100    %WHITE
            white(i,j)=1;
            green(i,j)=0;
            blue(i,j)=0;
            red(i,j)=0;
        elseif im(i,j,1)>150 & im(i,j,2)<65 & im(i,j,3)<30     %RED
            white(i,j)=0;
            green(i,j)=0;
            blue(i,j)=0;
            red(i,j)=1;
        elseif im(i,j,1)<80 & im(i,j,2)>50 & im(i,j,3)<80     %GREEN
            white(i,j)=0;
            green(i,j)=1;
            blue(i,j)=0;
            red(i,j)=0;
        elseif im(i,j,1)<100 & im(i,j,2)<100 & im(i,j,3)>150    %BLUE
            white(i,j)=0;
            green(i,j)=0;
            blue(i,j)=1;
            red(i,j)=0;
        else 
            white(i,j)=0;
            green(i,j)=0;
            blue(i,j)=0;
            red(i,j)=0;
       end
             end
end

figure('Name','white');imshow(white,[]);
figure('Name','green');imshow(green);
figure('Name','blue');imshow(blue);
figure('Name','red');imshow(red);
