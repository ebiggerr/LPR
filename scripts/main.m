% clears all the text from the Command Window
clc
% close all figures
close all;
% clear all variables from the current workspace
clear;
% clear global;

% envCfg = coder.gpuEnvConfig('host');
% envCfg.DeepLibTarget = 'cudnn';
% envCfg.DeepCodegen = true;
% envCfg.Quiet = true;
% coder.checkGpuInstall(envCfg);
% net = getSSDNW();

% open up window to select an image
[file,path] = uigetfile( {'*.jpg;*.bmp;*.png'} , 'Choose an image');
getPicture=[path,file];

% check if any file is selected
if( getPicture == 0 )
    return
% end when no file is selected
end

% CONSTANT
MAX_HEIGHT = 900;

picture = imread(getPicture);
[height,width,depth]=size(picture);

% oriWidth = width;
% oriHeight= height;

% resize the image of the resolution is too big ( height > MAX_HEIGHT) 
if (height > MAX_HEIGHT )
    picture = imresize(picture, 0.5);
    [resizedHeight,resizedwidth]=size(picture);
else
    %imshow(picture);
end

% run the core LPR function
image = detectLicensePlateAndDrawBoundingBox(picture);


%% CORE function of License Plate Recognition
% PARAM - original RGB image
% RETURN - coordinates  
function [result] = detectLicensePlateAndDrawBoundingBox(source)
    
    % pre processing the image
    greyscale = preProcessing(source);
    
    % edge detection using Sobel
    edge = edgeDetection(greyscale);
    
    result = bwareaopen(edge,70,8);

    result1 = bwareaopen(result,20,8);
    
    figure(5),imshow(source);
    [L,~]=bwlabeln(result,8);
    propied=regionprops(L,'BoundingBox');
    
    hold on
    pause(1)
    for n=1:size(propied,1)
      rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
    end
    hold off
    
    result= result1;

end




