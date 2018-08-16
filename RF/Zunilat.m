function [Zuni, Xa, Xb] = Zunilat(Z1)

	Z11 = Z1(1,1);
	Z12 = Z1(1,2);
	Z21 = Z1(2,1);
	Z22 = Z1(2,2);
	
	Xb = -real(conj(Z12)*det(Z1))/imag(Z12*conj(Z11));
	Xa = real(conj(Z11)*det(Z1))/imag(Z12*conj(Z11));

	Zb = [[0 0];  [0 i*Xb]];
	Ya = [[1 -1]; [-1 1]]/(i*Xa);
	
	Zuni = ((Z1+Zb)^-1+Ya)^-1;
		
end