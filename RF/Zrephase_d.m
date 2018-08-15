function [Xa, Xb, Sp] = Zrephase_d(Z1)
		
	Zd = Z1(1,1)+Z1(2,2);
	Zn = Z1(1,2)+Z1(2,1);
	
	as = imag(conj(Zn)*Z1(2,2));
	X0 = -as/real(Zn);

	bs = imag(Z1(2,2)*conj(Z1(1,1))+det(Z1));
	cs = real(det(Z1)*conj(Z1(2,2)));
	
	a = real(Zn)*bs - real(Zd)*as;
	b = real(Zn)*cs;
	c = as*cs;
	
	delta_4 = b^2 - a*c;

	Xa1 = (-b + sqrt(delta_4))/a;
	Xa2 = (-b - sqrt(delta_4))/a;
	
	Sp1 = (real(Zn)*Xa1^2 + as*Xa1)/(real(Zd)*Xa1^2+ bs*Xa1 + cs);
	Sp2 = (real(Zn)*Xa2^2 + as*Xa2)/(real(Zd)*Xa2^2+ bs*Xa2 + cs);
	
	diff_in_Xa0 = as/cs;
	
	if (Sp1>Sp2)
		Xa = Xa1;
		Sp = Sp1;
	else
		Xa = Xa2;
		Sp = Sp2;
	end

	Ya = [[0 0]; [0 1/(i*Xa)]];
	Y1 = Z1^-1;
	Zm = (Y1+Ya)^-1;
	Xb = -imag(conj(Zm(2,1)+Zm(1,2))*(Zm(1,1)+Zm(2,2)))/real(Zm(1,2)+Zm(2,1));
	
	Sp = real(Zm(2,1)+Zm(1,2))/real(Zm(1,1)+Zm(2,2));
	
	Zm = Zm + [[0 0]; [0 i*Xb]];
		
end