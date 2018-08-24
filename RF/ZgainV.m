function Av = ZgainV(Z1,ZL)
	Av = Z1(2,1)*ZL/(Z1(1,1)*ZL+det(Z1));
end