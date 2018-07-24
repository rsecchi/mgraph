% Impedance transformation given Z matrix and input impedance
function Zout = Ztrans(Z,Zin)
	Zout = Z(1,1) - Z(1,2)*Z(2,1)/(Z(2,2)+Zin);
end