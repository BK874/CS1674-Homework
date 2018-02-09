% Function [energyImage, Ix, Iy] = energy_image(im) - to compute
% the energy at each pixel using the magnitude of the x and y
% gradients.
% Inputs:
% im should be a nrows-x-ncols-x-3 matrix of class (datatype) uint8, ...
%    e.g. the output of imread on a color image. However, you need ...
%    to convert it to grayscale before computing the gradients, using ...
%    rgb2gray.
% Outputs:
% Each of the outputs energyImage, Ix, Iy should be 2D matrices of ...
%    class double.
%Ix, Iy are the gradients in the x and y directions, i.e. the dI/dx ...
%    and dI/dy; use two of the filters we discussed in class to compute ...
%    them. Don't use Matlab's imgradient function.
% energyImage is computed similar to equation 1 in the paper, but using ...
%    L2 norm: sqrt((dI/dx)^2+(dI/dy)^2).

function [energyImage, Ix, Iy] = energy_image(im)

img = rgb2gray(im);
imgD = im2double(img);

sobelX = [1 0 -1; 2 0 -2; 1 0 -1];
sobelY = sobelX';

Ix = imfilter(imgD, sobelX);
%figure; imshow(Ix)
Iy = imfilter(imgD, sobelY);
%figure; imshow(Iy)

energyImage = sqrt((Ix).^2+(Iy).^2);
%figure; imshow(energyImage);
