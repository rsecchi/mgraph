function [Sin, Sout] = Znormal(Z)
	Sm = Z2S(Z);
	[gin, gout] = adapt(Sm);
	Sin = imp_trs(gin);
	Sout = imp_trs(-gout);
	
	gainp(Z, S2Z(gin), S2Z(gout))
	
	Snorm = T2S(S2T(Sin)*S2T(Sm)*S2T(Sout))
	
	Ztrans_in(S2Z(Snorm), 50)
	
	gainp(S2Z(Snorm), 50, 50)
		
end