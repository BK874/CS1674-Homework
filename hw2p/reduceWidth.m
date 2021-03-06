% [5 pts] Function [reducedColorImage] = reduceWidth(im,
% display_flag) - to reduce the width of your image in a
% content-aware away. The function should call the energy_image,
% cumulative_minimum_energy_map, and find_optimal_vertical_seam
% functions.
% Inputs:
% The function should take in a nrows-x-ncols-x-3 matrix im of class ...
%    uint8.
%If the display_flag is set to true, the function should display, in ...
%   a 1x3 subplot, the following: (a) the energy image, (b) the ...
%   cumulative energy image, (c) the optimal seam (using ...
%                                                 displaySeam).
% Outputs:
% The output must be a 3D matrix reducedColorImage, of class uint8, ...
%    which is the same as the input image but with its width reduced ...
%    by one pixel.

function [reducedColorImage] = reduceWidth(im, display_flag)

energyImage = energy_image(im);
M = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
vs = find_optimal_vertical_seam(M);

num_rows = size(im, 1);
num_cols = size(im, 2);
num_chan = size(im, 3);

assert(length(vs) == num_rows);

reduceColorImage = zeros([num_rows num_cols-1 num_chan]);

for i = 1:num_rows
    for j = 1:num_chan
        this_row = im(i, :, j);
        this_row(vs(i)) = [];
        reducedColorImage(i, :, j) = this_row;
    end
end

reducedColorImage = uint8(reducedColorImage);

if(display_flag)
    figure;
    subplot(1, 3, 1); imagesc(energyImage);
    subplot(1, 3, 2); imagesc(M);
    subplot(1, 3, 3); imshow(im); displaySeam(im, vs, 'VERTICAL')
end