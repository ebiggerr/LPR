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
[height,width]=size(picture);

% resize the image of the resolution is too big
if (height >= MAX_HEIGHT )
    picture = imresize(picture, 0.5);
    %[height,width]=size(picture);
else
    %imshow(picture);
end

% run the core LPR function
result = detectLicensePlateAndDrawBoundingBox(picture);
% display the result
imshow(result);

function [processed] = detectLicensePlateAndDrawBoundingBox(source)
    
    % pre processing the image
    greyscale = preProcessing(source);
    
    edge = edgeDetection(greyscale);
    
    
    
end


