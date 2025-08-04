function image = average_filter(image,x)
    
    image = double(image);
    
    [rows,cols] = size(image);
    result_image = zeros(rows, cols);
    
    % define the filter, that all weights are the same, 1/x^2, x is the
    % size of the filter.
    kernel = ones(x, x) / x^2;
    
    % add padding base on the size of the filter
    padding = (x-1)/2;
    % add rows and cols to the original size image
    padding_image = zeros(rows+2*padding,cols+2*padding);
   
    % put the original image to the middle of the all zero padding image to
    % get the image with padding
    padding_image(1+padding:rows+padding,1+padding:cols+padding) = image;

    image = padding_image;
    
    % multiply the filter with the masked area, which is considered as
    % convolution operation.
    for i = 1+padding:rows+padding
        for j = 1+padding:cols+padding
            
            area = image(i-padding:i+padding, j-padding:j+padding);
            
            % get the sum which is the average value for the pixel
            filtered_value = sum(sum(area .* kernel));
            
            result_image(i-padding, j-padding) = filtered_value;
        end
    end
    image = uint8(result_image);
end