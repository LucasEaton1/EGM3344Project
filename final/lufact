function [L, U] = lufact(A)

n = size(A, 1); %tells you how many steps to take from Kff
L = eye(n); %identity matrix
U = zeros(n);
Ak = A;

for k = 1:n-1
    
    if abs(Ak(k,k)) < eps * max(abs(A(:)))
        error('zero pivot at step %d', k);
    end
    
    U(k,:) = Ak(k,:); %copy pivot row into U, U(k,k) is the pivot
    L(:,k) = Ak(:,k) / U(k,k); %divide column by pivot to get multipliers
    Ak = Ak - L(:,k) * U(k,:); %subtract the outer product
end

U(n,n) = Ak(n,n);

L = tril(L); %make L lower triangular (make entries that are supposed to be 0 exactly = to 0
U = triu(U); %make U upper triangular (make entries that are supposed to be 0 exactly = to 0
end
