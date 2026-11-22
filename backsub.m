function x = backsub(U, b)

n = size(U, 1);
x = zeros(n, 1);
x(n) = b(n) / U(n,n);

for i = n-1:-1:1
    s = U(i, i+1:n) * x(i+1:n);
    x(i) = (b(i) - s) / U(i,i);
end
end
