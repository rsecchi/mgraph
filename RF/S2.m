% The function converts the Z matrix into an S matrix
function S = S2(Z,Zin,Zout)
    Z0 = diag([Zin,Zout]);
	S = (Z-Z0)/(Z+Z0);
end
