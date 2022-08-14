x = 0:1/999:1;
n = length(x);

u = exp(-100*(x-0.5).^2);

xx = 0:1/1999:1;
mir = zeros(2*n,1);
mir(xx>0.4 & xx<0.6) = 1;

u(1) = 0;

st = zeros(2*n,1);
st(1:n) = sintr(u);

ist = sintr(st)*sqrt(2).*mir;

figure
plot(real(ist))

con = sintr(ist);

figure
stem(real(con))