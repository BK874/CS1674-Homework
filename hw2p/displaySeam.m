% Function displaySeam(im, seam, seamDirection) - to display the
% selected type of seam on top of the input image.
% Inputs:
% The input im should be the result of an imread.
% seamDirection should be the string 'HORIZONTAL' or 'VERTICAL'.
% seam should be the output of find_optimal_vertical_seam or ...
%    find_optimal_horizontal_seam (which are provided for you).

function displaySeam(im, seam, seamDirection)

%figure; imshow(im);
hold on;
if(strcmp(seamDirection, 'HORIZONTAL'))
    plot(seam, 'r', 'LineWidth', 2);
elseif (strcmp(seamDirection, 'VERTICAL'))
    plot(seam, 'r', 'LineWidth', 2);
    else
end

