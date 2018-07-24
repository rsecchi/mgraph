% Takes a two-port as input and returns a passive 
% two-port network so the total input-output phase is zero
function [Sr1, Sr2] = Srephase(Sm)
	
	[Sn, Sin, Sout] = Snormal(Sm);
	
	A = Sn(2,1) + Sn(1,2);
	B = -det(Sn);
	
	aB = abs(B);
	phiA = arg(A);
	phiB = arg(B);
	
	phi = atan(tan(phiB/2-phiA)*(1+aB)/(1-aB)) - phiB/2;
	
	sh1 = [[1 0]; [0  exp(i*phi)]];
	sh2 = [[1 0]; [0 -exp(i*phi)]];
	
	rSin = [[Sin(2,2) Sin(2,1)]; [Sin(1,2) Sin(1,1)]];
		
	Sr1 = T2S(S2T(sh1*Sout*sh1)*S2T(rSin));
		
	Sr1 = T2S( S2T(sh1*Sout*sh1) * S2T(rSin) );
	Sr2 = T2S( S2T(sh2*Sout*sh2) * S2T(rSin) );
	
end