% Takes a two-port as input and returns a passive 
% two-port network so the total input-output phase is zero
function  Sr = L(phi, gammaB, gammaA)
	
	TA = imp_trs(gammaA);
	TB = imp_trs(-gammaB);
	
	phiA = arg(1+gammaA);
	phiB = -arg(1+gammaB);
	
	phiR = phi - phiA - phiB;
	
	R = [[0 exp(i*phiR)]; [exp(i*phiR) 0]];
	
	Sr = T2S(S2T(TB)*S2T(R)*S2T(TA));
	
end