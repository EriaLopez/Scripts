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
maxFrames = 64;

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
workingFrame = vidFrame(:,:,:,30);

% Get histogram of original frame 
figure(5)
histogram(workingFrame)

% Contrast adjustment
figure(2)
subplot(2,2,1);imshow(workingFrame);
subplot(2,2,3);histogram(workingFrame)
contAdj = imadd(workingFrame,80);
subplot(2,2,2);imshow(contAdj);
subplot(2,2,4);histogram(contAdj)

% Convert to HSV whole RGB image
figure(8)
hsv_map = rgb2hsv(contAdj);
subplot(2,2,1); imshow(hsv_map)
hsv_map_h = hsv_map(:,:,1);
subplot(2,2,2); imshow(hsv_map_h)
hsv_map_s = hsv_map(:,:,2);
subplot(2,2,3); imshow(hsv_map_s)
hsv_map_v = hsv_map(:,:,3);
subplot(2,2,4); imshow(hsv_map_v)

% Saturation of Red channel
figure(3)
subplot(2,2,1);imshow(workingFrame);
subplot(2,2,3);histogram(workingFrame)
redSat = workingFrame;
redSat(:,:,1) = redSat(:,:,1) + 80;
subplot(2,2,2);imshow(redSat);
subplot(2,2,4);histogram(redSat)

% Saturation of Green channel
figure(6)
subplot(2,2,1);imshow(workingFrame);
subplot(2,2,3);histogram(workingFrame)
greenSat = workingFrame;
greenSat(:,:,2) = greenSat(:,:,2) + 80;
subplot(2,2,2);imshow(greenSat);
subplot(2,2,4);histogram(greenSat)

% Saturation of Blue channel
figure(7)
subplot(2,2,1);imshow(workingFrame);
subplot(2,2,3);histogram(workingFrame)
blueSat = workingFrame;
blueSat(:,:,3) = blueSat(:,:,3) + 80;
subplot(2,2,2);imshow(blueSat);
subplot(2,2,4);histogram(blueSat)

% Edges
figure(4)
vidFrameInGray = rgb2gray(workingFrame);
IEr = edge(vidFrameInGray,'roberts'); %Roberts edges
IEp = edge(vidFrameInGray,'prewitt'); %Prewitt edges
IEs = edge(vidFrameInGray,'sobel'); %Sobel edges
subplot(2,2,1);imshow(IEr);
subplot(2,2,2);imshow(IEp);
subplot(2,2,3);imshow(IEs);

% Substraction of frames n - (n-1)
index_substractionFrames = 2;
figure(9)
while index_substractionFrames < maxFrames
    vidFrame_subs(:,:,:,(index_substractionFrames-1)) = vidFrame(:,:,:,index_substractionFrames) - vidFrame(:,:,:,(index_substractionFrames-1));
    index_substractionFrames = index_substractionFrames + 1;
end

size(vidFrame_subs)

% Display substractionFrames
j = 1;
while j < index_substractionFrames
    image(vidFrame_subs(:,:,:,j), 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(1/vidObj.FrameRate);
    j=j+1
end