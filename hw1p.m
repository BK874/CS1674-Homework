% 1. Generate a 1000000x1 (one million by one) vector of random numbers
% from a Gaussian (normal) distribution with mean of 0 and standard
% deviation of 5. Use Matlab's randn function.
m = 0;
d = 5;
v = d.*randn(1000000, 1) + m;

% 2. Add 1 to every value in the previous list, by using a loop. To
% determine how many times to loop, use Matlab's size
% function. Time this operation and print the number in the
% code. Write that number down in answers.txt. Use Matlab's
% documentation to find out how to time operations.

tic
for i=1:size(v)
   v(i,:) = v(i,:) + 1;
end
toc

% 3. Now add 1 to every value in the original random vector,
% without using a loop. Time this operation, print the time and
% write it down. Use a different way to print the number than the
% method you used above. (See ways to print numbers at the
% beginning of the Matlab tutorial script.)

tic
v + 1;
t = toc;
disp("Elapsed time " + t)

% 4. Create two matrices A and B which, when added together, result
% in a 10x10 matrix C containing all numbers from 1 to 100. In
% other words, when I add A and B and convert the result to vector
% form, I should get a vector containing all numbers from 1 to
% 100. In code, C = A + B; assert(all(C(:) == (1:100)') == 1); Each
% matrix should only be created with a single command (no loops).

A = reshape(0.5:0.5:50, 10, 10, []);
B = reshape(0.5:0.5:50, 10, 10, []);
C = A + B

%  5. Plot the exponential function 2.^x, for non-negative even
%  values of x smaller than 100, without using loops.

x = 2:2:98;
plot(2.^x)

% 6. Create a script that prints all the values between 1 and 10,
% in random order, with pauses of 1 second between each two prints.

V = randperm(10);
for y = V
    disp(y)
    pause(1)
end

% 7. Generate two random matrices A and B, and compute their
% product by hand, using loops. The size of the first matrix should
% be [5, 3] and of the second [3, 5]. Check your code by comparing
% the loop-computed product with the product that you get from
% Matlab's A*B.

A = rand(5, 3);
B = rand(3, 5);
[rowA, colA] = size(A);
[rowB, colB] = size(B);
product = zeros(rowA, colB);
for row = 1 : rowA
    for col = 1 : colB
        sum = 0;
        for i = 1 : colA
            sum = sum + A(row, i) * B(i, col);
        end
        product(row, col) = sum;
    end
end
product
productCheck = A * B

% 12. Read this image into Matlab as a matrix, and write down its
% dimensions.

Im = imread('pittsburgh.png');
size(Im);

% 13. Convert this image to grayscale

G = rgb2gray(Im);

% 14. Use the function sum and a logical operator which measures
% equality to a scalar, to determine and write down how many pixels
% in the grayscale image are equal to 6. Don't use loops.

%GD = im2double(G);
clear sum;
G2 = G;
S = sum(G(:) == 6);

% 15.Find the darkest pixel in the image, and write its value and
% [row, column] in your answer sheet. Don't use loops. Hint:
% Convert to a vector first, and use Matlab's ind2sub function. Use
% Matlab's help to find out how to use that function.

GA = G(:);
D = min(GA);
IND = find(GA == D);
GS = size(G);
[I, J] = ind2sub(GS, IND);


% 16. Consider a 31x31 square (a square with side equal to 31
% pixels) that is centered on the darkest pixel from question
% 14. Replace all pixels in that square with white pixels (pixels
% with value 255). Do this with loops.

for i = I-15:I+15
    for j = J-15:J+15
        G(i, j) = 255;
    end
end

% 17. Take the previous image with the white square in it. 
% Place a 121x121 gray square (e.g. pixel values 150) at the 
% center of this image. This time you are NOT allowed to use 
% loops. Hint: You can access a range of rows and columns in 
% a matrix; think about how.

S = size(G)
MR = ceil(S(1)/2)
MC = ceil(S(2)/2)
G(MR-60:MR+60, MC-60:MC+60) = 150;

% 18. Make a new figure, display the modified image (which 
% includes both a white square and gray square), and save
%the new figure to a file using saveas(gcf, 'new_image.png').

figure; imshow(G)
%saveas(gcf, 'new_image.png');


% 19. Using the original pittsburgh.png image, compute the 
% scalar average pixel value along each channel (R, G, B) 
% separately, then subtract the average value per channel.
% Display the resulting image and write it to a file
% mean_sub.png. If you choose to do this using a new matrix
% as your image, make sure it is of the same class/datatype
% (uint8) as the original image; a simple cast would do the job.
% You may use loops.

AS = sum(sum(Im));
IS = size(Im);
RAVG = AS(1)/(IS(1) * IS(2));
GAVG = AS(2)/(IS(1) * IS(2));
BAVG = AS(3)/(IS(1) * IS(2));

Im(:, :, 1) = Im(:, :, 1) - RAVG;
Im(:, :, 2) = Im(:, :, 2) - GAVG;
Im(:, :, 3) = Im(:, :, 3) - BAVG;

figure; imshow(Im)
saveas(gcf, 'mean_sub.png');

