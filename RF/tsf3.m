function [L,C] = tsf3(Rin, RL, w)
	
	L = RL/w*sqrt(Rin/RL-1);
    C = 1/(Rin*w)*sqrt(Rin/RL-1);
	
end