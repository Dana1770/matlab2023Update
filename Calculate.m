function [new_image] = Calculate(Old_image, operators, number)
    [H, W, L] = size(Old_image);
    if operators == '+'
        new_image = Old_image + number;
    elseif operators == '-'
        new_image = Old_image - number;
    elseif operators == '*'
        new_image = Old_image * number;
    elseif operators == '/'
        if number == 0
            disp('Error: Division by zero is not allowed.');
            return;
        else
            new_image = Old_image / number;
        end
    else
        disp('Error: This operator is not supported.');
        return;
    end

    % Ensure the output has the same data type as the input
    new_image = cast(new_image, class(Old_image));
end
