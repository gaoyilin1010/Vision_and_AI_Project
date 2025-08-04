function characters = vertical_seg(lines, character_starts_cell, character_ends_cell)

    % first count the number of characters
    cnt = 0;
    for i = 1 : numel(lines)
        cnt = cnt + length(character_starts_cell{i});
    end
    
    % create a cell for the characters
    characters = cell(cnt, 1);

    % each character needs a index to save
    index = 0;

    % segment the characters line by line
    for i = 1 : numel(lines)

        line = double(lines{i});
    
        for j = 1:length(character_starts_cell{i})
            character = line(:,character_starts_cell{i}(j):character_ends_cell{i}(j));
            index = index + 1;
            characters{index} = uint8(character);
        end
    end
end

