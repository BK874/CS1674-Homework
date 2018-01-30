% 10. Create a function function [val] = fib(n) that returns the
% n-th number (n >= 1) in the Fibonacci sequence 1, 1, 2, 3, 5, 8,
% 13...

function [val] = fib(n)

fib_vect = zeros(n, 1);
fib_vect(1) = 1;
fib_vect(2) = 1;

for i = 3:n
    fib_vect(i) = fib_vect(i-1) + fib_vect(i-2);
end

val = fib_vect(n);