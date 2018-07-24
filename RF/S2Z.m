% The function converts the S matrix into an Z matrix
function Z = S2Z(S, R0=50)
    sz = size(S)(1,1);
	Z = R0*(eye(sz)+S)/(eye(sz)-S);
end
