function [a,a_real,a_imag,x,t] = plot_xt_td( name, s )

fileID = fopen(name);

x = load('x.dat');
t = load('t2.dat');
t = t(1:s:end);

NX = length(x);
NT = length(t);

a = zeros(2*NX, NT);

for i=1:NT
%     ftell(fileID)
    fseek(fileID, (i-1)*s*2*8*NX, 'bof');        
    a(:,i) = fread(fileID, 2*NX, 'double');    
%     ftell(fileID)
%     if i == 1
%         error('stop')
%     end
end

fclose(fileID);

a_real = a(1:2:end,:);
a_imag = a(2:2:end,:);

a = abs(complex(a_real,a_imag));
% a = a_real.*a_real;
% a = a + a_imag.*a_imag;
% a = sqrt(a);

figure
surf(t,x,a);

shading interp

ax=gca;
ax.XLabel.String='T';
ax.YLabel.String='X';
ax.ZLabel.String='A';
end

