
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
function S = Z2S(Z,R0=50)
	S = (Z-R0*eye(2))/(Z+R0*eye(2));
end

% The function converts the Z matrix into an S matrix
function Z = S2Z(S, R0=50)
	S = R0*(eye(2)+S)/(eye(2)-S);
end

% S to Transfer params
function T = S2T(S)
	T11 = -det(S)/S(2,1);
	T12 = S(1,1)/S(2,1);
	T21 = -S(2,2)/S(2,1);
	T22 = 1/S(2,1);
	T = [[T11 T12]; [T21 T22]];
end

% Transfer to S parameters
function S = T2S(T)
	S11 = T(1,2)/T(2,2);
	S12 = det(T)/T(2,2);
	S21 = 1/T(2,2);
	S22 = -T(2,1)/T(2,2);
	S = [[S11 S12]; [S21 S22]];
end


