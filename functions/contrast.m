function image = contrast(image,x,y)

    image = double(image);  % change the grayscale image to double, for calculations

    minimum = min(image(:));  % minimum pixel value in image
    maximum = max(image(:));  % maximum pixel value in image
    
    % change the pixel values to [0,1] with 0 as the minimum pixel value,
    % with 1 as the maximum pixel value.
    normalize = (image - minimum) / (maximum - minimum); 
    
    % shift the normalized value by x, to [-x, 1-x]. this step is similar to 
    % set a threshold, from -x to 0 will get darker, from 0 to 1-x will get
    % brighter.
    normalize = normalize - x;
                                            
    image = normalize * y;  % contrast facter y

    image = max(image, -x);  % values smaller than -x will be considered as black
    image = min(image, 1-x);  % values larger than 1-x will be considered as white
    
    image = uint8((image+x) * 255);  % shift the normalized value back to [0,1] and change to image format
end

