function image = white_8(image, n)

    [rows, cols] = size(image);
    image = double(image);

    %fill the noise, iterate 5 times
    for t = 1 : 5
        for i = 2:rows-1
            for j = 2:cols-1
                if image(i,j) == 255

                    %check 8 pixels around it
                    cnt = image(i-1,j-1) + image(i-1,j) + image(i-1,j+1) +...
                    image(i,j-1) + image(i,j+1) + image(i+1,j-1) + ...
                    image(i+1,j) + image(i+1, j+1);

                    if cnt < 255 * n  % at least n white pixels around
                        image(i,j) = 0;  % change to black if less than n
                    end

                end
            end
        end
    end
end