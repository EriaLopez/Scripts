% 
% Eria Lopez
% Universidad Autonoma de Guadalajara
%

% Construct a multimedia reader object associated with file
vidObj = VideoReader('C:\Users\Carmina\Documents\Master\ProcesamientoDeImagenes\take_2.mov');

% Specify that reading should start at 0.5 seconds from the
% beginning.
%vidObj.CurrentTime = 0.5;

% Create an axes
currAxes = axes;

% Num of max frames to obtain
maxFrames = 16;

vidObj.FrameRate
i = 1
figure(1)
% Read video frames until available
while hasFrame(vidObj) & i<maxFrames
    vidFrame(:,:,:,i) = readFrame(vidObj);
    image(vidFrame(:,:,:,i), 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(1/vidObj.FrameRate);
    i=i+1
end

%Work with only one frame for practical purposes
workingFrame = vidFrame(:,:,:,10);

%Color slicing
sz=size(workingFrame);
leftColumnLimit = 610;
rightColumnLimit = 1122;
upperRowLimit = 180;
lowerRowLimit = 996;
 
for i=upperRowLimit:lowerRowLimit                     %loop in axis X
    for j=leftColumnLimit:rightColumnLimit                %loop in axis Y
        if workingFrame(i,j,1)>190 & workingFrame(i,j,2)<90 & workingFrame(i,j,3)<70    %Red slicing
            white(i,j)=0;
            green(i,j)=0;
            blue(i,j)=0;
            red(i,j)=1;
        else 
            white(i,j)=0;
            green(i,j)=0;
            blue(i,j)=0;
            red(i,j)=0;
       end
    end
end

figure('Name','red_slicing');imshow(red);