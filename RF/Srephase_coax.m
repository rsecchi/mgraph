% Takes a two-port as input and returns a passive 
% two-port network so the total input-output phase is zero
function [Sr1, Sr2] = Srephase_coax(Sm)
			
	A = Sm(2,1) + Sm(1,2);
	B = -det(Sm);
	
	aB = abs(B);
	phiA = arg(A);
	phiB = arg(B);
	
	phi = atan(tan(phiB/2-phiA)*(1+aB)/(1-aB)) - phiB/2;
	
	Sr1 = [[0 1]; [1 0]]*exp(i*phi);
	Sr2 = [[0 1]; [1 0]]*exp(i*(phi+pi));
end