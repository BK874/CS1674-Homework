% 11. Implement a function function [N] = my_unique(M) that takes
% in a matrix M, removes duplicate rows from that input matrix and
% outputs the result as matrix N. You cannot call Matlab's unique
% function. Loops are allowed.

function [N] = my_unique(M)

dupe = zeros(size(M,1), 1);

for i = 1:size(M, 1)
    test_row = M(i, :);
    for j = i:size(M, 1)
        if j ~= i;
            if M(j, :) == M(i, :)
                for l = 1:size(dupe, 1)
                    if l == 0
                        dupe(l, 1) = j
                    end
                end
            end
        end
    end
end

S = size(M, 1);

for z = 1:S
    if z ~= 0
        M(z, :) = []
        if size(M, 1) < S
            break
        end
    end
end

N = M;
