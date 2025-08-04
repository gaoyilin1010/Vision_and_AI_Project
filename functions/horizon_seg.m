function lines = horizon_seg(BW, line_starts, line_ends)

    BW = double(BW);
    lines = cell(length(line_starts), 1);

    % after getting the line_starts and line_ends, we can segment the
    % original image to different lines.
    for i = 1:length(line_starts)
        line = BW(line_starts(i):line_ends(i),:);
        lines{i} = uint8(line);  % change each line to a image
    end
end

