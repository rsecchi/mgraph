% Check if the Z matrix is passive
function t = ispassive(Z)

	if not(isequal(Z,transpose(Z)))
		t = 0;
		return;
	end

	S = ZtoS(Z); 
	t = (sum(sum(abs(S).^2) > 1+1e-7)==0);
	
end

