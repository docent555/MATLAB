function s = isintr(v)

n = length(v);

s = zeros(2*n,1);

% s(2:end/2) = v(2:end);
s(2:end/2) = -v(2:end)*(1i);
s(end:-1:end/2+2) = -s(2:end/2);

s = ifft(s);

% s = s(1:n)/1i/sqrt(2*n);
s = s(1:n);

end

