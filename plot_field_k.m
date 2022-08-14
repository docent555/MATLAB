function [a,a_real,a_imag,k,z,ph] = plot_field_k( name, s )

fileID = fopen(name);

k = load('k.dat');
z = load('z.dat');
z = z(1:s:end);

NK = length(k);
NZ = length(z);

a = zeros(2*NK, NZ);

for i=1:NZ
%     ftell(fileID)
    fseek(fileID, (i-1)*s*2*8*NK, 'bof');        
    a(:,i) = fread(fileID, 2*NK, 'double');    
%     ftell(fileID)
%     if i == 1
%         error('stop')
%     end
end

fclose(fileID);

a_real = a(1:2:end,:);
a_imag = a(2:2:end,:);

a = abs(complex(a_real,a_imag));
ph = angle(complex(a_real,a_imag));
% a = a_real.*a_real;
% a = a + a_imag.*a_imag;
% a = sqrt(a);

figure
surf(z,k,a);

shading interp

ax=gca;
ax.XLabel.String='Z';
ax.YLabel.String='K';
ax.ZLabel.String='A';
end

