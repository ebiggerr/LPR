function [result] = edgeDetection(source)
    
    % edge detection using Sobel
    temp = edge(source,'Sobel',0.25,'both');
    %imshowpair(source,temp,'montage')
    
    result= temp;
    
end

