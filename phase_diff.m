function [phd] = phase_diff( a1r, a1i, a2r, a2i, x, z )

a1 = complex(a1r,a1i);
a2 = complex(a2r,a2i);

phd = angle(a1 ./ a2);

figure
surf(z,x,phd);

shading interp

ax=gca;
ax.XLabel.String='Z';
ax.YLabel.String='X';
ax.ZLabel.String='A';
end

