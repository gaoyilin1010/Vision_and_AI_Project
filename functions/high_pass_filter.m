function image = high_pass_filter(image, D0)

    [rows, cols] = size(image);
    
    % use 2D fourier transform
    frq_d = fft2(double(image));
    frq_d = fftshift(frq_d);  % shift zero frequency to the centre
    
    % get the mid point of the image, which is also the mid point of
    % frequency domain
    rows_mid = floor(rows/2);
    cols_mid = floor(cols/2);
    
    % use the high-pass filter formula to get the filter
    h = zeros(rows, cols);
    for i = 1:rows
        for j = 1:cols
            d = ((i - rows_mid)^2 + (j - cols_mid)^2);
            h(i, j) = 1 - exp(-(d) / (2 * (D0^2)));
        end
    end
    
    % apply the high-pass filter to the frequency domain
    filtered_freq = h .* frq_d;
    
    % inverse Fourier transform to go back to the spatial domain
    filtered_freq = ifftshift(filtered_freq);  % shift back the frequency to original position
    image = real(ifft2(filtered_freq));  % we only need the real parts
    
    image = mat2gray(image);  % normalize image to [0, 1]
    image = uint8(255 * image);  % scale to [0, 255]

end
