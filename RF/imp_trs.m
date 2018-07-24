function trs = imp_trs(gamma)
	S0 = sqrt(1-abs(gamma)^2);
	trs = [[-gamma S0]; [S0 conj(gamma)]];
end
	