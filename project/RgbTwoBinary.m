
function [newimg] = RgbTwoBinary(rgb, option, threshold)
    [R, C, D] = size(rgb);  % Get the size of the input RGB image
    gray = RgbTwoGray(rgb, option);  % Call RgbTwoGray function with input arguments
    binary = GrayTwoBinary(gray, threshold);  % Call GrayTwoBinary function with input arguments
    newimg = binary;  % Assign the result to newimg
end
