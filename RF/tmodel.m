% The function returns a T model of a reciprocal
% passive network. 
function m = tmodel(Z)
	if not(ispassive(Z))
		error("Z matrix not passive");
	end
	Z1 = Z(1,1)-Z(1,2); printf("Z1: "); print_comp(Z1);
	Z2 = Z(1,2); printf("Z2: "); print_comp(Z2);
	Z3 = Z(2,2)-Z(1,2); printf("Z3: "); print_comp(Z3); 
end
