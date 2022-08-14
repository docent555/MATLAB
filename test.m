x = 0:1/999:1;
n = length(x);

u = exp(-100*(x-0.5).^2);

mir = zeros(n,1);
mir(x>0.4 & x<0.6) = 1;

u(1) = 0;

s = zeros(2*n,1);
s(2:end/2) = u(2:end);
s(end:-1:end/2+2) = -u(2:end);
ft = fft(s);
stem(abs(ft))
st = 1i*ft(1:n)/sqrt(2*n);

ist= zeros(2*n,1);
ist(2:n) = sqrt(2*n)*st(2:n)/1i;
ist(end:-1:end/2+2) = -ist(2:n);

% max(real(ft - ist))
% max(imag(ft - ist))

hold on
stem(abs(ist))
ist = ifft(ist);

% max(real(s - ist))
% max(imag(s - ist))

con = zeros(4*n,1);
con(2:n) = real(ist(2:n)).*mir(2:end);
con(end:-1:3*n+2) = -con(2:n);
ft = fft(con);
stem(abs(ft))
st = 1i*ft(1:n)/sqrt(2*n);


figure
plot(con)
