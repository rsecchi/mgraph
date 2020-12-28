function matrix_to_circuit(M, w)

# matrix_to_circuit(M, w)
#    M:  transmission matrix
#    w:  angular frequency (rad/s)

	X1 = imag((M(1,1)-1)/M(2,1));
	X2 = imag(1/M(2,1));
	X3 = imag((M(2,2)-1)/M(2,1));

	if (X1>0)
		printf("L_ser=%g  ", X1/w);
	else
		printf("C_ser=%g  ", -1/(X1*w));
	end

	if (X2>0)
		printf("L_par=%g  ", X2/w);
	else
		printf("C_par=%g  ", -1/(X2*w));
	end

	if (X3>0)
		printf("L_ser=%g\n", X3/w);
	else
		printf("C_ser=%g\n", -1/(X3*w));
	end

	Z = [[M(1,1) det(M)]; [1 M(2,2)]]/M(2,1);
	Y = Z^-1;

	1/(Y(1,1)-Y(2,1));
	1/Y(2,1);
	1/Y(1,2);
	1/(Y(2,2)-Y(2,1));

	-1/M(1,2);

	X1 = imag(M(1,2)/(M(2,2) - 1));
	X2 = imag(M(1,2));
	X3 = imag(M(1,2)/(M(1,1) - 1));

	if (X1>0)
		printf("L_par=%g  ", X1/w);
	else
		printf("C_par=%g  ", -1/(X1*w));
	end

	if (X2>0)
		printf("L_ser=%g  ", X2/w);
	else
		printf("C_ser=%g  ", -1/(X2*w));
	end

	if (X3>0)
		printf("L_par=%g\n", X3/w);
	else
		printf("C_par=%g\n", -1/(X3*w));
	end
	

end
