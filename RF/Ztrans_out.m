% Impedance transformation given Z matrix and input impedance
function Zout = Ztrans_out(Z,Zin)
	Zout = Z(2,2) - Z(1,2)*Z(2,1)/(Z(1,1)+Zin);
end