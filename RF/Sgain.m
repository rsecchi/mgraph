% Calculate the Maximum Available Gain for a stable two-port (K>=1) 
%
function Gmax = Sgain(S1)
	k = SRollet(S1);
	
	if (k<1) 
		printf("k=%6.4g  => Two-port not unconditionally stable\n", k);
		return;
	end
	
	if (abs(S1(1,2))>1e-7)
		Gmax = abs(S1(2,1)/S1(1,2))*(k-sqrt(k^2-1));Z
	else
		Gmax = abs(S1(2,1))^2/((1-abs(S1(1,1))^2)*(1-abs(S1(2,2))^2));
	end
end