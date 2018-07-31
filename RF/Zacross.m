function Z2 = Zacross(Z1,Za)
	Y = [[1/Za -1/Za]; [-1/Za 1/Za]];
	Z2 = (Z1^-1+Y)^-1;
end