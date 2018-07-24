%
function print_comp(Z, f0=1e5)
	R = real(Z);
	printf("R %.3g\t\t", R);
	X = imag(Z);
	if (X>0)
		printf("L %0.3g\n", X/(2*pi*f0))
	else
		printf("C %0.3g\n", 1/(2*pi*f0*X))
	end

end

