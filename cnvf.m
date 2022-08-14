function [s, f] = cnvf(u,v)

n = length(v);

fu = zeros(1,4*n);
fv = zeros(1,4*n);

fu(1:n) = u;
fv(1:n) = v;

fu = ifft(fu);
fv = ifft(fv);

f = fu;

s = fft(4*n*fu.*fv);

end

