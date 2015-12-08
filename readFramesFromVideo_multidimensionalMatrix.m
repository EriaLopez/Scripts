
% Construct a multimedia reader object associated with file
vidObj = VideoReader('C:\Users\Carmina\Documents\Master\ProcesamientoDeImagenes\take_2.mov');

% Specify that reading should start at 0.5 seconds from the
% beginning.
%vidObj.CurrentTime = 0.5;

% Create an axes
currAxes = axes;

vidObj.FrameRate
i = 1
% Read video frames until available
while hasFrame(vidObj) & i<100
    vidFrame(:,:,:,i) = readFrame(vidObj);
    image(vidFrame(:,:,:,i), 'Parent', currAxes);
    currAxes.Visible = 'on';
    pause(1/vidObj.FrameRate);
    i=i+1
end