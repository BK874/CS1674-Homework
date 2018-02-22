function [features, x, y, scores] = compute_features(x, y, scores, ...
                                                  Ix, Iy)

% 1. [5 pts] If any of your detected keypoints are less than 5
% pixels from the top/left or 5 pixels from the bottom/right of the
% image, i.e. pixels lacking 5+5 neighbors in either the horizontal
% or vertical direction, erase this keypoint from the x, y, scores
% vectors at the start of your code and do not compute a descriptor
% for it.

imgSize = size(Ix);
for i = 1:imgSize(2)
    if x(i) <= 5
        x(i) = [];
        y(i) = [];
        scores(i) = [];
    elseif x(i) >= imgSize(2) - 5
        x(i) = [];
        y(i) = [];
        scores(i) = [];
    end
end

for j = 1:imgSize(1)
    if y(j) <= 5
        y(j) = [];
        x(j) = [];
        scores(j) = [];
    elseif y(j) >= imgSize(1) - 5
        y(j) = [];
        x(j) = [];
        scores(j) = [];
    end
end

% 2. [5 pts] To compute the gradient magnitude m(x, y) and gradient
% angle θ(x, y) at point (x, y), take L to be the image and use the
% formula below shown in class and Matlab's atand, which returns
% values in the range [-90, 90]. If the gradient magnitude is 0,
% then both the x and y gradients are 0, and you should ignore the
% orientation for that pixel (since it won't contribute to the
% histogram).

magnitude = zeros(imgSize);
orientation = zeros(imgSize);
