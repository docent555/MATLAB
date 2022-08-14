function [s, f] = cnv(u, v)

n = length(v);

fu = zeros(1,4*n);
fv = zeros(1,4*n);

u = sqrt(2*n)*u/1i;
v = sqrt(2*n)*v/1i;

fu(2:n) = u(2:end);
fu(2*n:-1:n+2) = -u(2:end);

fv(2:n) = v(2:end);
fv(2*n:-1:n+2) = -v(2:end);

f = fu(1:end/2);

fu = ifft(fu);
fv = ifft(fv);

s = fft(4*n*fu.*fv);
s = s(1:n)/sqrt(2*n);

end

