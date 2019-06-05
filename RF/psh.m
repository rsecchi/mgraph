function Xb = psh(Z11, Z12, Z21, Z22, Zin, f0)

    ZL = Z11 - Z12*Z21/(Z22 + Zin);
	
	Gp = real(Zin)/real(ZL) * abs(Z21/(Z22+Zin))^2
	
	
	H0 = Z21*Zin/(Z11*Zin + Z11*Z22 - Z12*Z21);
	H1 = sqrt(real(1/Zin)/real(1/ZL));

	module = abs(H0*H1)
	phase = -arg(H0*H1)
	
    V1 = 1;
	V2 = sqrt(real(1/Zin)/real(1/ZL))*exp(i*phase);
	
	I1 = V1/Zin;
	I2 = -V2/ZL;
	
	d = imag(I1*conj(I2));
	
	w0 = 2*pi*f0;
	
	Xa = -real(I1+I2)/d;
	Xb = real(I1)/d;
	Xc = real((I1+I2)*conj(V2))/d;
	
	%Xb = real(Zin)/imag(Zin/ZL*sqrt(real(1/Zin)/real(1/ZL))*exp(i*phase))
	
	
	
	X1 = [(Xa>0)*Xa + (Xa<0)/Xa]/w0;
	X2 = [(Xb>0)*Xb + (Xb<0)/Xb]/w0;
	X3 = [(Xc>0)*Xc + (Xc<0)/Xc]/w0;
	
end