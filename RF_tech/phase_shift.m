function phase_shift(phi, Z0, w)

# phase_shift(phi, Z0, w)
#
# phi = phase shift in radians
# Z0  = characteristic impedance
# w   = angular velocity (rad/sec)
#
# The output is calculated from the load to the source
# as a series/parallel discrete components

	X1 = -Z0*tan(phi/2);
	X2 = Z0*csc(phi);

	if (X1>0)

		L = X1/w;
		C = -1/(X2*w);
		printf("L_ser=%g C_par=%f L_ser=%g", L, C, L);
 
	else

		C = -1/(X1*w);
		L = X2/*w;
		printf("C_ser=%g L_par=%f C_ser=%g", C, L, C);

	endif

end

