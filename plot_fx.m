function [a,a_real,a_imag,x,z,h,NX,NZ,zi] = plot_fx( name, zc, zi)

x = load('x.dat');
z = load('z.dat');
h = z(2)-z(1);

NX = length(x);
NZ = length(z);

if nargin < 3
    zi = round(zc / h);
end
if zi > NZ
    zi = NZ;
end
if zi < 1
    zi = 1;
end

fileID = fopen(name);
fseek(fileID, (zi-1)*2*8*NX, 'bof');
a = fread(fileID, 2*NX, 'double');
fclose(fileID);

a_real = a(1:2:end,:);
a_imag = a(2:2:end,:);

a = abs(complex(a_real,a_imag));
% a = a_real.*a_real;
% a = a + a_imag.*a_imag;
% a = sqrt(a);

figure
plot(x,a);

shading interp

ax=gca;
ax.XLabel.String='Z';
ax.YLabel.String='A';
end

