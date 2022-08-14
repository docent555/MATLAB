function [a,a_real,a_imag,x,z,h,NX,NZ,xi] = plot_fz( name, xc, xi)

x = load('x.dat');
z = load('z.dat');
h = x(2)-x(1);

NX = length(x);
NZ = length(z);

if nargin < 3
    xi = round(xc / h);
end
if xi > NX
    xi = NX;
end
if xi < 1
    xi = 1;
end

% a_real = zeros(NZ,1);
% a_imag = zeros(NZ,1);

fileID = fopen(name);
fseek(fileID, (xi-1)*2*8, 'bof');
a_real = fread(fileID, NZ, 'double', 2*8*(NX-1) + 8);
fseek(fileID, (xi-1)*2*8 + 8, 'bof');
a_imag = fread(fileID, NZ, 'double', 2*8*(NX-1) + 8);
% for i=1:NZ
%     a_real(i) = fread(fileID, 1, 'double');
%     a_imag(i) = fread(fileID, 1, 'double');
%     status = fseek(fileID, i*2*8*NX, 'bof');
%     if status == -1
%         break
%     end
% end
fclose(fileID);


a = abs(complex(a_real,a_imag));
% a = a_real.*a_real;
% a = a + a_imag.*a_imag;
% a = sqrt(a);

size(a)

figure
plot(a);

shading interp

ax=gca;
ax.XLabel.String='Z';
ax.YLabel.String='A';
end

