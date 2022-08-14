function [a,a_real,a_imag,x,t,ph] = plot_field_t( name, s )

fileID = fopen(name);

x = load('x.dat');
t = load('t.dat');
t = t(1:s:end);

NX = length(x);
NT = length(t);

a = zeros(2*NX, NT);

for i=1:NT
    fseek(fileID, (i-1)*s*2*8*NX, 'bof');        
    a(:,i) = fread(fileID, 2*NX, 'double');    
end

fclose(fileID);

a_real = a(1:2:end,:);
a_imag = a(2:2:end,:);

a = abs(complex(a_real,a_imag));
ph = angle(complex(a_real,a_imag));

figure
surf(t,x,a);

shading interp

ax=gca;
ax.XLabel.String='T';
ax.YLabel.String='X';
ax.ZLabel.String='A';
end

