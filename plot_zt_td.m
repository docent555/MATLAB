function [a,a_real,a_imag,z,t] = plot_zt_td( name, s )

fileID = fopen(name);

z = load('z.dat');
t = load('t2.dat');
t = t(1:s:end);

NZ = length(z);
NT = length(t);

a = zeros(2*NZ, NT);

for i=1:NT
%     ftell(fileID)
    fseek(fileID, (i-1)*s*2*8*NZ, 'bof');        
    a(:,i) = fread(fileID, 2*NZ, 'double');    
%     ftell(fileID)
%     if i == 1
%         error('stop')
%     end
end

fclose(fileID);

a_real = a(1:2:end,:);
a_imag = a(2:2:end,:);

a = complex(a_real,a_imag);

a = fft(a);
a = fftshift(a);
a = abs(a);

% a = abs(complex(a_real,a_imag));
% a = a_real.*a_real;
% a = a + a_imag.*a_imag;
% a = sqrt(a);

figure
surf(t,z,a);

shading interp

ax=gca;
ax.XLabel.String='T';
ax.YLabel.String='Zplot';
ax.ZLabel.String='A';
end

