function image = rgb2binary(image, threshold)

    image = double(image);
    [rows, cols] = size(image);

    for i = 1:rows
        for j = 1:cols
            if (image(i,j) < threshold)
                image(i,j) = 0;  % if the pixel value is smaller than the threshold, change it to black
            else
                image(i,j) = 255;  % if the pixel value is larger than the threshold, change it to white
            end
        end
    end
    
    image = uint8(image);
end