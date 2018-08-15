function [Xa,Zp]=Zrephase_s(Z1)
	Zn = (Z1(1,2)+Z1(2,1));
	Zd = (Z1(2,2)+Z1(1,1));
	Xa = -imag(conj(Zn)*Zd)/real(Zn);
	Zp = Zn/(Zd+Xa*i);
end