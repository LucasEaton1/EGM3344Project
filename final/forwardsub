function x = forwardsub(L, b)

n = size(L, 1);
x = zeros(n, 1);
x(1) = b(1) / L(1,1);

for i = 2:n
    s = L(i, 1:i-1) * x(1:i-1);
    x(i) = (b(i) - s) / L(i,i);
end
end
