

% Construct a multimedia reader object associated with file
vidObj = VideoReader('C:\Users\Carmina\Documents\Master\ProcesamientoDeImagenes\take_2.mov');

% Specify that reading should start at 0.5 seconds from the
% beginning.
%vidObj.CurrentTime = 0.5;

% Create an axes
currAxes = axes;

vidObj.FrameRate
i = 1
figure(1)
% Read video frames until available
while hasFrame(vidObj) & i<51
    vidFrame(:,:,:,i) = readFrame(vidObj);
    image(vidFrame(:,:,:,i), 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(1/vidObj.FrameRate);
    i=i+1
end

% Get histogram
figure(5)
histogram(vidFrame(:,:,:,30))

% Contrast adjustment
figure(2)
subplot(2,2,1);imshow(vidFrame(:,:,:,50));
subplot(2,2,3);histogram(vidFrame(:,:,:,50))
contAdj = imadd(vidFrame(:,:,:,50),80);
subplot(2,2,2);imshow(contAdj);
subplot(2,2,4);histogram(contAdj)

% Convert to HSV
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
subplot(2,2,1);imshow(vidFrame(:,:,:,50));
subplot(2,2,3);histogram(vidFrame(:,:,:,50))
redSat = vidFrame(:,:,:,50);
redSat(:,:,1) = redSat(:,:,1) + 80;
subplot(2,2,2);imshow(redSat);
subplot(2,2,4);histogram(redSat)

% Saturation of Green channel
figure(6)
subplot(2,2,1);imshow(vidFrame(:,:,:,50));
subplot(2,2,3);histogram(vidFrame(:,:,:,50))
greenSat = vidFrame(:,:,:,50);
greenSat(:,:,2) = greenSat(:,:,2) + 80;
subplot(2,2,2);imshow(greenSat);
subplot(2,2,4);histogram(greenSat)

% Saturation of Blue channel
figure(7)
subplot(2,2,1);imshow(vidFrame(:,:,:,50));
subplot(2,2,3);histogram(vidFrame(:,:,:,50))
blueSat = vidFrame(:,:,:,50);
blueSat(:,:,3) = blueSat(:,:,3) + 80;
subplot(2,2,2);imshow(blueSat);
subplot(2,2,4);histogram(blueSat)

% Edges
figure(4)
vidFrameInGray = rgb2gray(vidFrame(:,:,:,50));
IEr = edge(vidFrameInGray,'roberts'); %Roberts edges
IEp = edge(vidFrameInGray,'prewitt'); %Prewitt edges
IEs = edge(vidFrameInGray,'sobel'); %Sobel edges
subplot(2,2,1);imshow(IEr);
subplot(2,2,2);imshow(IEp);
subplot(2,2,3);imshow(IEs);