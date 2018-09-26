function S2 = Sin(S1,gamma)
	S2 = S1(1,1) + S1(1,2)*S1(2,1)*gamma/(1-S1(2,2)*gamma);
end