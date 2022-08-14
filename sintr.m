function s = sintr(v)

n = length(v);

s = zeros(2*n,1);

s(2:end/2) = v(2:end);
s(end:-1:end/2+2) = -v(2:end);

s = fft(s);
% s = four(s);

s = real(1i*s(1:n)/sqrt(2*n));

end

