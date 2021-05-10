function [result] = edgeDetection(source)
    
    % edge detection using Sobel
    result = edge(source,'sobel',0.28,'both');
    %imshowpair(source,temp,'montage')
    
   
    
end

