function [b,k] = spmode(fname, len, s)

a = load(fname);

sz = size(a, 1);
endi = sz - len + 1;
b =  zeros(endi, len);

for i = 1:s:endi
    b(i,:) = fft(a(i:i+len-1));
%     disp(i)
end

% b(:,1) = 0;
% b = fftshift(abs(b));
b = abs(b(:,1:len/2-1));
% k = (-len/2:len/2-1);
k = (1:len/2-1);
end

