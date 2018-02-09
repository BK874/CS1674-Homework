% [5 points] Function [] = generate_results(filename, reduceAmt,
% reduceWhat) - to run the functions you wrote, and the provided
% functions, on an image, and show the results. In your function,
% after reading in the image, you should call reduceWidth or
% reduceHeight as many times as needed to reduce the width/height
% by the requested amount, but should only set the display flag to
% true in the first iteration. You should also display, in a 1x3
% subplot: (a) the original image, (b) the final
% content-aware-reduced image, and (c) the content-agnostic
% reduction using a simple imresize. Label the figure with a title
% indicating what was reduced, and by how many pixels. Label the
% subfigures with titles "original", "content-aware", and
% "standard" (put one title after each subplot).

% Inputs:
% filename is a character array (e.g. 'pittsburgh.png'),
% reduceAmt is an integer which says by how many pixels to reduce the ...
%    width/height, and
% reduceWhat is 'WIDTH' or 'HEIGHT'.

function [] = generate_results(filename, reduceAmt, reduceWhat)

im = imread(filename);

if(strcmp(reduceWhat, 'HEIGHT'))
    for i = 1:reduceAmt
        if(i == 1)
            resized = reduceHeight(im, true);
        else
            resized = reduceHeight(resized, false);
        end
    end
    standResize = imresize(im, [size(im, 1) - reduceAmt, size(im, 2)]);
elseif(strcmp(reduceWhat, 'WIDTH'))
        for i = 1:reduceAmt
            if(i == 1)
                resized = reduceWidth(im, true);
            else
                resized = reduceWidth(resized, false);
            end
        end
        standResize = imresize(im, [size(im, 1), size(im, 2) - reduceAmt]);
else
end

figTitle = ['Reduced ' reduceWhat ' by ' num2str(reduceAmt) ' pixels'];

figure('Name', figTitle, 'NumberTitle', 'off');
subplot(1, 3, 1); imshow(im); title('Original');
subplot(1, 3, 2); imshow(resized); title('Content-aware');
subplot(1, 3, 3); imshow(standResize); title('Standard');
