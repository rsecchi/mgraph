function [L,C] = tsf(Rin, RL, w)

	C = 1/(RL*w)*sqrt(RL/Rin-1);
	L = Rin/w*sqrt(RL/Rin-1);

end