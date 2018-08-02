% The function converts the Z matrix into an S matrix
function S = S(Z,R0=50)
    sz = size(Z)(1,1);
	S = (Z-R0*eye(sz))/(Z+R0*eye(sz));
end
