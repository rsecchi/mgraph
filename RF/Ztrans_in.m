% Impedance transformation given Z matrix and input impedance
function Zin = Ztrans_in(Z1,Zout)
	Zin = Z1(1,1) - Z1(1,2).*Z1(2,1)./(Z1(2,2).+Zout);
end
