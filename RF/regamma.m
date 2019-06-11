function regamma(v, Z1, Z0=50)
	gamma = v(:,1)+i*v(:,2)
	v = ((Z0-Z1)+(Z0+Z1)*gamma)./((Z0+Z1)+(Z0-Z1)*gamma);
	plot(real(v),imag(v));
end