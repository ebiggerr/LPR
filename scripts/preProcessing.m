function [image] = preProcessing(source)
    
    % convert the RGB image to grayscale image
    processed = rgb2gray(source);
    
    
    
    
    %return the processed image
    image = processed;
end

