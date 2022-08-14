function m = mirr(x, n, L)

m = zeros(1,2*n);

nn = 1:n-1;

m(1) = 0;
m(2:n) = L/2*(cos(pi*nn/L*x) - cos(pi*nn/L*(1-x)))./(pi*nn);

end

