% Impedance transformation given Z matrix and input impedance
function Zin = Ztrans_in(Z,Zout)
	Zin = Z(1,1) - Z(1,2).*Z(2,1)./(Z(2,2).+Zout);
end
