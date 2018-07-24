function [phi, mod] = Zphase(Z)
	H = (Z(2,1)+Z(1,2))/(Z(1,1)+Z(2,2));
	phi = arg(H);	
	mod = abs(H);
end