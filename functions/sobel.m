function image = sobel(image)

    sobelTemp=double(image);
    [rows, cols] = size(sobelTemp);
    sobelx=zeros(rows,cols);

    % horizental filter
    for i=2:rows-1
        for j=2:cols-1
            % using the horizontal sobel filter to get Gx
            sobelx(i,j)=(-1*sobelTemp(i-1,j-1)+0*sobelTemp(i-1,j)+1*sobelTemp(i-1,j+1) ...
                -2*sobelTemp(i,j-1)+0*sobelTemp(i,j)+2*sobelTemp(i,j+1) ...
                -1*sobelTemp(i+1,j-1)+0*sobelTemp(i+1,j)+1*sobelTemp(i+1,j+1));
        end
    end

    % show the result of horizontal sobel filter
    sobelx=sqrt(sobelx.^2); % this step is to get absolute value, only written to show horizontal result.
    sobelx=uint8(sobelx);
    figure, imshow(sobelx)

    % vertical filter
    sobely=zeros(rows,cols);
    for i=2:rows-1
        for j=2:cols-1
            % using the vertical sobel filter to get Gy
            sobely(i,j)=(1*sobelTemp(i-1,j-1)+2*sobelTemp(i-1,j)+sobelTemp(i-1,j+1) ...
                +0*sobelTemp(i,j-1)+0*sobelTemp(i,j)+0*sobelTemp(i,j+1) ...
                -sobelTemp(i+1,j-1)-2*sobelTemp(i+1,j)-sobelTemp(i+1,j+1));
        end
    end
    % show the result of vertical sobel filter
    sobely=sqrt(sobely.^2);
    sobely=uint8(sobely);
    figure, imshow(sobely)

    sobely=double(sobely);
    sobelx=double(sobelx);

    % combine the two results
    sobelxy=sqrt(sobelx.^2+sobely.^2);
    sobelxy=uint8(sobelxy);
    image = sobelxy;
end