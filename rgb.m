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
maxFrames = 80;

vidObj.FrameRate
i = 1
figure(1)
% Read video frames until available
while hasFrame(vidObj) & i<maxFrames
    vidFrame(:,:,:,i) = readFrame(vidObj);
    workingFrame = vidFrame(:,:,:,i);
    i=i+1
end

%Work with only one frame for practical purposes
workingFrame = vidFrame(:,:,:,3);
% 
% R = workingFrame(:,:,1);
% G = workingFrame(:,:,2);
% B = workingFrame(:,:,3);
% r = R(:);
% g = G(:);
% b = B(:);
% % plot3(r,g,b,'*');
% 
% YIQ = rgb2ntsc(workingFrame);
% Y = YIQ(:,:,1);
% I = YIQ(:,:,2);
% Q = YIQ(:,:,3);
% figure;imshow(Y);title('Y');
% figure;imshow(I);title('I');
% figure;imshow(Q);title('Q');

YCBCR = rgb2ycbcr(workingFrame);
Y = YCBCR(:,:,1);
Cb = YCBCR(:,:,2);
Cr = YCBCR(:,:,3);
figure;imshow(Y);title('Y');
figure;imshow(Cb);title('Cb');
figure;imshow(Cr);title('Cr');