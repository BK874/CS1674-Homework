% [5 pts] In a script filter_responses.m, use a cell array to store
% the list of filenames so you can loop over them
% (e.g. filenames{i}). Read in all images, convert them to
% grayscale, and resize them to the same square size
% (e.g. 100x100), so that the visual map of responses (filtering
% outputs) can be more comparable across images. Compute the
% cross-correlation of each image with each of the 48 filters using
% imfilter.

filenames = {'cardinal1.jpg', 'cardinal2.jpg', 'leopard1.jpg', ...
             'leopard2.jpg', 'panda1.jpg', 'panda2.jpg'}