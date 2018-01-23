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

I = imread('pittsburgh.png');
size(I)

% 13. Convert this image to grayscale

G = rgb2gray(I); figure; imshow(G);

% 14. Use the function sum and a logical operator which measures
% equality to a scalar, to determine and write down how many pixels
% in the grayscale image are equal to 6. Don't use loops.

G = double(G);
clear sum;
S = sum(G(:) == 6)

% 15Find the darkest pixel in the image, and write its value and
% [row, column] in your answer sheet. Don't use loops. Hint:
% Convert to a vector first, and use Matlab's ind2sub function. Use
% Matlab's help to find out how to use that function.
