function [ZL1,ZL2] = Ziter(Z1)

	Z11 = Z1(1,1);
	Z12 = Z1(1,2);
	Z21 = Z1(2,1);
	Z22 = Z1(2,2);

	ZL1 = -(sqrt(Z22^2+2*Z11*Z22-4*Z12*Z21+Z11^2)+Z22-Z11)/2;
	ZL2 = (sqrt(Z22^2+2*Z11*Z22-4*Z12*Z21+Z11^2)-Z22+Z11)/2;
	
	
	ZG1 = -(sqrt(Z22^2+2*Z11*Z22-4*Z12*Z21+Z11^2)-Z22+Z11)/2;
	ZG2 = (sqrt(Z22^2+2*Z11*Z22-4*Z12*Z21+Z11^2)+Z22-Z11)/2;
	
	Av1 = -(2*Z21)/(sqrt(Z22^2+2*Z11*Z22-4*Z12*Z21+Z11^2)-Z22-Z11);
	Av2 = (2*Z21)/(sqrt(Z22^2+2*Z11*Z22-4*Z12*Z21+Z11^2)+Z22+Z11);
	
	
	
end