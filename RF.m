
% Check if the Z matrix is passive
function t = ispassive(Z)

	if not(isequal(Z,transpose(Z)))
		t = 0;
		return;
	end

	S = ZtoS(Z); 
	t = (sum(sum(abs(S).^2) > 1+1e-7)==0);
	
end

%
function print_comp(Z, f0=1e5)
	R = real(Z);
	printf("R %.3g\t\t", R);
	X = imag(Z);
	if (X>0)
		printf("L %0.3g\n", X/(2*pi*f0))
	else
		printf("C %0.3g\n", 1/(2*pi*f0*X))
	end

end


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

% The function returns a Pi model of a reciprocal
% passive network
function m = pmodel(Z)
end

% The function returns the Zin, Zout that maximise
% the
function [Zin, Zout] = adapt(Z)
end

% Maximum available gain
function Ga = gain(Z)
end

% The function converts the Z matrix into an S matrix
function S = ZtoS(Z,R0=50)
	S = (Z-R0*eye(2))/(Z+R0*eye(2));
end

% Gain
