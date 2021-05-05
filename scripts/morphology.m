function [image] = morphology(source)

 se = [1;1;1];
 
 image = imerode(source,se);
 
 se = strel('rectangle',[100,150]);
 
 image= imclose(image,se);
 
 % clean up small objects in the image
 image= bwareaopen(image,2000);

end