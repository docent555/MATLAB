function ff = ifour(f)

ff = ifour1(real(f), imag(f));

ff = complex(ff(1:2:end), ff(2:2:end))/length(f);

end