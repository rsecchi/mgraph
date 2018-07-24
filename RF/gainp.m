% Operating gain
function Gp = gainp(Z, ZG, ZL)
	RL = real(ZL);
	RG = real(ZG);
	Zin = Ztrans_in(Z,ZL);
	Rin = real(Zin);
	Zout = Ztrans_out(Z,ZG);
	Rout = real(Zout);
	
	Pin = Rin/(2*abs(Zin+ZG)^2);
	PL = (RL*abs(Z(2,1))^2)/(2*abs((Z(1,1)+ZG)*(Zout+ZL))^2);
	
	Gp = PL/Pin;
end
