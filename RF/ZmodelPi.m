% The function returns a Pi model of a reciprocal
% passive network
function ZmodelPi(Z1, f0)
	Y1 = Z1^-1;
	Ya =  Y1(1,1) + Y1(1,2); print_comp(1/Ya, f0);
	Yb = -Y1(1,2);           print_comp(1/Yb, f0);
	Yc =  Y1(2,2) + Y1(1,2); print_comp(1/Yc, f0);
end
