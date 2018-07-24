function [Snorm, Sin, Sout] = Snormal(Sm)
	
	[gin, gout] = adapt(Sm);
	Sin = imp_trs(gin');
	Sout = imp_trs(-gout);
	Snorm = T2S(S2T(Sin)*S2T(Sm)*S2T(Sout));
	
end