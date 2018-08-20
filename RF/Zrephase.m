% function [ZZ, Zr, mod, phi] = Zrephase(Z1);
%
%   inputs: 
%       Z1:   two-port impedance matrix
%
%   outputs
%       ZZ:  rephased output impedance
%       Z1:  rephasing circuit
%      mod:  modulus of (Z12+Z21)/(Z22+Z11)
%      phi:  phase of (Z12+Z21)/(Z22+Z11)
%
function [ZZ, Zr, mod, phi] = Zrephase(Z1);

	[Sr1, Sr2] = Srephase(S(Z1));
	Zr1 = Z(Sr1);
	Zr2 = Z(Sr2);
	
	ZZ1 = T( T(Z1) * T(Zr1) );
	ZZ2 = T( T(Z1) * T(Zr2) );
	
	[phi1, mod1] = Zphase(ZZ1);
	[phi2, mod2] = Zphase(ZZ2);
	
	if ( real(exp(i*phi1)) > 0 )
			ZZ = ZZ1;
			Zr = Zr1;
			phi = phi1;
			mod = mod1;
	else
			ZZ = ZZ1;
			Zr = Zr2;
			phi = phi2;
			mod = mod2;
	end
end