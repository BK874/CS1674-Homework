% 11. Implement a function function [N] = my_unique(M) that takes
% in a matrix M, removes duplicate rows from that input matrix and
% outputs the result as matrix N. You cannot call Matlab's unique
% function. Loops are allowed.

function [N] = my_unique(M)

for i:size(M, 1)
    test_row = M(i, :);
