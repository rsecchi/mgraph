function [L,C] = tsf2(Rin, RL, w)

	C = 1/(Rin*w)/sqrt(RL/Rin-1);
	L = RL/w/sqrt(RL/Rin-1);

end