function [phi, mod] = Sphase(S)
	H = (S(2,1)+S(1,2))/(1-det(S));
	phi = arg(H);
	mod = abs(H);
end