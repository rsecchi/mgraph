% The function converts the Z matrix into an S matrix
function Z = S2Z(S, R0=50)
	S = R0*(eye(2)+S)/(eye(2)-S);
end
