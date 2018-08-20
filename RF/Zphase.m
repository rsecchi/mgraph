function [phi, mod] = Zphase(Z1)
	H = (Z1(2,1)+Z1(1,2))/(Z1(1,1)+Z1(2,2));
	phi = arg(H);	
	mod = abs(H);
end