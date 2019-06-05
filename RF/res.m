function [R1 R2] = res(RS,RL, eta)

	delta = 2*sqrt(1-eta);
	x1 = (2 - eta + delta)/eta	
	R1 = RS*x1
	H1 = sqrt(RL/(RS*x1))
	
	x2 = (2 - eta - delta)/eta
	R2 = RS*x2
	H2 = sqrt(RL/(RS*x2))
	
	
	
end