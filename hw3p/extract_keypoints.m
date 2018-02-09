% Input:
% image is a color image of class uint8 which you should convert to ...
%    grayscale and double in your function.
% Outputs:
% Each of x,y is an nx1 vector that denotes the x and y locations, ...
%    respectively, of each of the n detected keypoints (i.e. points ...
%                                                  with "cornerness" ...
%                                                  R scores greater ...
%                                                  than a threshold ...
%                                                  who survive the ...
%                                                  non-maximum ...
%                                                  suppression). Keep ...
%    in mind that x denotes the horizontal direction, hence columns ...
%    of the image, and y denotes the vertical direction, hence rows, ...
%    counting from the top-left of the image.
% scores is an nx1 vector that contains the R score for each detected ...
%        keypoint.
%    Ih,Iv are matrices with the same number of rows and columns as ...
%        your input image, and store the gradients in the x (horizontal) ...
%        and y (vertical) directions at each pixel.

function [x, y, scores, Ih, Iv] = extract_keypoints(image);

% 1. [5 pts] Let's do some preprocessing. First, set some parameters
% for use in your functions, at the beginning of your function: set
% the value of k (from the "Harris Detector: Algorithm" slide) to
% 0.05, and use a window size of 5. Second, read in the image, and
% convert it to grayscale. Compute the horizontal image gradient Ih
% and the vertical image gradient Iv; you can reuse code to compute
% gradients from HW2P. Finally, initialize with zeros a matrix R of
% the same size as the image that will store the "cornerness"
% scores for each pixel.

% k value and window size
k = 0.05;
winSize = 5;

% Convert image to grayscale and double
img = rgb2gray(image);
imgD = im2double(img);

% Compute the gradients
sobelX = [1 0 -1; 2 0 -2; 1 0 -1];
sobelY = sobelX';

% Horizontal Gradient:
Ih = imfilter(imgD, sobelX);
% Vertical Gradient:
Ic = imfilter(imgD, sobelY);

% Zero matrix to store "cornerness" of each pixel
imgSize = size(imgD);
R = zeros(imgSize);

% 2. Use a double loop to compute the cornerness score R(i, j) at
% each pixel i, j. This score depends on a 2x2 matrix M computed
% for each pixel, as shown in the slides. This matrix relies on all
% neighbors of i, j that are less than half_window_size away from
% it. Thus, the matrix M for a given pixel is a summation of
% window_size^2 matrices, each of size 2x2. Each of the 2x2 entries
% is the product of gradient image values at a particular
% pixel. After computing M, use the formula from class to compute
% the R(i, j) score for that pixel.

for i = 1:imgSize(1)
    for j = 1:imgSize(2)
        M = zeros(2, 2);
        for x = i-1:i+1
            for y = j-1:j+1
                M(1, 1) = M(1, 1) + Ih(x, y)^2;
                M(1, 2) = M(1, 2) + Ih(x, y) * Iv(x, y);
                M(2, 1) = M(2, 1) + Ih(x, y) * Iv(x, y);
                M(2, 2) = M(2, 2) + Iv(x, y)^2;
            end
        end
        R(i, j) = det(M) - k(trace(M))^2;
    end
end

% 3. [5 pts] After computing all R(i, j) scores, it is time to
% threshold them in order to find which pixels correspond to
% keypoints. You can set the threshold for the "cornerness" score R
% however you like; for example, you can set it to 5 times the
% average R score. Alternatively, you can simply output the top n
% keypoints (e.g. top 1%).

threshold = 50000; % Currently arbitrary