function [image] = preProcessing(source)
    
    % convert the RGB image to grayscale image
    image = rgb2gray(source);
    
    % increase the contrast
    image = imadjust(image,[0.2,0.7],[]);
    
    % median filter to remove noise
    image = medfilt2(image);
    %return the processed image
    
end

