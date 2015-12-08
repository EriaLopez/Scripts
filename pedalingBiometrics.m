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
maxFrames = 100;

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
% workingFrame = vidFrame(:,:,:,10);

%Color slicing
leftColumnLimit = 610;
rightColumnLimit = 1300;
upperRowLimit = 180;
lowerRowLimit = 1080;
figure('Name','red_slicing');

 
for k=1:(maxFrames-1)
    workingFrame = vidFrame(:,:,:,k);
    for i=upperRowLimit:lowerRowLimit                     %loop in axis X
        for j=leftColumnLimit:rightColumnLimit                %loop in axis Y
            if workingFrame(i,j,1)>190 & workingFrame(i,j,2)<90 & workingFrame(i,j,3)<70    %Red slicing
                white((i-(180-1)),(j-(610-1)))=0;
                green((i-(180-1)),(j-(610-1)))=0;
                blue((i-(180-1)),(j-(610-1)))=0;
                red((i-(180-1)),(j-(610-1)),k)=1;
            else 
                white((i-(180-1)),(j-(610-1)))=0;
                green((i-(180-1)),(j-(610-1)))=0;
                blue((i-(180-1)),(j-(610-1)))=0;
                red((i-(180-1)),(j-(610-1)),k)=0;
           end
        end
    end
    imshow(red(:,:,k),[]);
%     %Dilation
%     figure(3);
%     figure('Name','dilation');
%     dilatedArray(:,:,k) = imdilate(red(:,:,k),structuringElement);
%     for dilIndex=1:dilIterations
%         dilatedArray(:,:,k) = imdilate(dilatedArray(:,:,k),structuringElement);
%     end
%     imshow(dilatedArray(:,:,k),[]);
end

%Dilation
figure('Name','dilation');
dilIterations = 7;
structuringElement = [0 1 0; 1 1 1; 0 1 0];
for m=1:(maxFrames-1)
    dilatedArray(:,:,m) = imdilate(red(:,:,m),structuringElement);
    for dilIndex=1:dilIterations
        dilatedArray(:,:,m) = imdilate(dilatedArray(:,:,m),structuringElement);
    end
    imshow(dilatedArray(:,:,m),[]);
    pause(1/vidObj.FrameRate);
end

for index=1:(maxFrames-1) 
    %Find centroids
    figure('Name','centroids');
    Ilabel = bwlabel(dilatedArray(:,:,index));
    centroids = regionprops(Ilabel, 'centroid');
    imshow(dilatedArray(:,:,index)); hold on;
    for x=1:numel(centroids)
        plot(centroids(x).Centroid(1),centroids(x).Centroid(2),'ro');
    end

    %Equations
    %Hip-knee
    m_hn = (centroids(5).Centroid(2)-centroids(2).Centroid(2))/(centroids(5).Centroid(1)-centroids(2).Centroid(1)); %(y2-y2)/(x2-x1)
    x_hn = centroids(2).Centroid(1):0.2:centroids(5).Centroid(1);    %vector from left-most point to right-most point
    y_hn = (m_hn * (x_hn-centroids(2).Centroid(1))) + centroids(2).Centroid(2);    %y = m(x-x1)+y1
    plot(x_hn,y_hn,'LineWidth',3);
    %Knee-ancle
    m_ka = (centroids(5).Centroid(2)-centroids(3).Centroid(2))/(centroids(5).Centroid(1)-centroids(3).Centroid(1));
    x_ka = centroids(3).Centroid(1):0.2:centroids(5).Centroid(1);
    y_ka = (m_ka * (x_ka-centroids(3).Centroid(1))) + centroids(3).Centroid(2);
    plot(x_ka,y_ka,'LineWidth',3);
    %Ancle-tip
    m_at = (centroids(3).Centroid(2)-centroids(4).Centroid(2))/(centroids(3).Centroid(1)-centroids(4).Centroid(1));
    x_at = centroids(3).Centroid(1):0.2:centroids(4).Centroid(1);
    y_at = (m_at * (x_at-centroids(4).Centroid(1))) + centroids(4).Centroid(2);
    plot(x_at,y_at,'LineWidth',3);
    pause(1/vidObj.FrameRate);

    %Angles
    %Knee angle
    v1 = y_hn(size(y_hn,2)-100 : size(y_hn,2));
    v2 = y_ka(size(y_ka,2)-100 : size(y_ka,2));
    cosThetaKnee = dot(v1,v2)/(norm(v1)*norm(v2))
    thetaKneeDegrees = acos(cosThetaKnee)*180/pi
    %Ancle angle
    %v3 = y_at(size(y_at,2)-100 : size(y_at,2));
    v3 = y_at(1 : 101);
    cosThetaAncle = dot(v2,v3)/(norm(v2)*norm(v3))
    thetaAncleDegrees = acos(cosThetaAncle)*180/pi
end


