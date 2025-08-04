function [line_starts, line_ends] = find_text_line(BW)
    % Use the vertical projection method to find the lines.
    horizontal_projection = sum(BW, 2);  % add all the pixel values in each rows
    figure;
    % show the sum in histogram, which is called horizontal_projection
    bar(horizontal_projection, 'k');
    title('horizontal_projection');
    xlabel('rows');
    ylabel('sum');
    axis tight;

    line_starts = [];
    line_ends = [];
    
    i = 1;

    % if the sum for a row is 0 , means there is no character at this line,
    % if we want to find the start of a line, we need the non-zero value
    % following a zero value. similarly, we need a zero value after a
    % non-zero value as the line end.
    while i < length(horizontal_projection)
        if horizontal_projection(i) == 0
            i = i+1;
            continue
        else
            for j = 1:length(horizontal_projection) - i
                if horizontal_projection(i+j) > 0
                    continue
                else
                    line_starts = [line_starts; i];
                    line_ends = [line_ends; i+j];
                    i = i+j;
                    break
                end
            end
        end
    end

end

