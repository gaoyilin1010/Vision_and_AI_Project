function [character_starts_cell, character_ends_cell] = find_characters(lines)
    
    % find each character using vertical projection method, it is similar
    % to find the lines, but since those characters are found line by line,
    % we need to use cells to contain the results from find_text_line, and
    % dealing with one line in one loop.
    character_starts_cell = {};
    character_ends_cell = {};

    for k = 1 : numel(lines)

        % show the vertical_projection histogram
        vertical_projection = sum(lines{k}, 1);
        figure;
        bar(vertical_projection, 'k');
        title('vertical_projection');
        xlabel('rows');
        ylabel('sum');
        axis tight;
        
        character_starts = [];
        character_ends = [];

        % if the sum for a col is 0 , means there is no character at this column,
        % if we want to find the start of a character, we need the non-zero value
        % following a zero value. similarly, we need a zero value after a
        % non-zero value as the character end.
        i = 1;
        while i < length(vertical_projection)
            if vertical_projection(i) == 0
                i = i+1;
                continue
            else
                for j = 1:length(vertical_projection) - i
                    if vertical_projection(i+j) > 0
                        continue
                    else
                        character_starts = [character_starts; i];
                        character_ends = [character_ends; i+j];
                        i = i+j;
                        break
                    end
                end
            end
        end
        character_starts_cell{k} = character_starts;
        character_ends_cell{k} = character_ends;
    end
    
end

