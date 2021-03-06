function Znorm = Znormal(Z)
	Sm = Z2S(Z);
	[gin, gout] = adapt(Sm);
	Sin = imp_trs(gin');
	Sout = imp_trs(-gout);
	Snorm = T2S(S2T(Sin)*S2T(Sm)*S2T(Sout));
	Znorm = S2Z(Snorm);
end