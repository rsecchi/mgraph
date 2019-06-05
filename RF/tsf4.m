function [L,C] = tsf4(Rin, RL, w)
	
	L = Rin/w/sqrt(Rin/RL-1);
    C = 1/(RL*w)/sqrt(Rin/RL-1);
	
end