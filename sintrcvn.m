function s = sintrcvn(v)

n = length(v);

s = zeros(4*n,1);

s(2:end/4) = v(2:end);
s(end/2:-1:end/4+2) = -v(2:end);

s = fft(s);
% s = four(s);

s = 1i*s(1:n)/sqrt(2*n);

end

