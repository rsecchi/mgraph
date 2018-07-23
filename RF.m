
% RF main
function funs = RF()
  f.fun1 = @Ze;
  funs = f;
end

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
function [Gamma_in, Gamma_out] = adapt(S)
   
  % Rollet Factor
  delta = det(S);
  K = (1 - abs(S(1,1))^2 - abs(S(2,2))^2 + abs(delta)^2)/(2*abs(S(1,2)*S(2,1)));
  
  if not( (K>1) && (abs(delta)<1) )
    error("The two-port is not unconditionally stable");
  end
  
  B1 = 1 + abs(S(1,1))^2 - abs(S(2,2))^2 - abs(delta)^2;
  B2 = 1 + abs(S(2,2))^2 - abs(S(1,1))^2 - abs(delta)^2;
  C1 = S(1,1) - delta*conj(S(2,2));
  C2 = S(2,2) - delta*conj(S(1,1));
  D1 = abs(S(1,1))^2 - abs(delta)^2;
  D2 = abs(S(2,2))^2 - abs(delta)^2;
  
  Gamma_in  = (B1 - sqrt(B1^2 - 4*abs(C1)^2))/(2*C1);
  Gamma_out = (B2 - sqrt(B2^2 - 4*abs(C2)^2))/(2*C2);
  
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


% Example common-base amplifier
function Ze = Ze()
  Ze = zeros(2);
  Ze(1,1) = 22.18 + i*5.36;
  Ze(1,2) = 12.19 + i*5.60;
  Ze(2,1) = 464.7 - i*371.0;
  Ze(2,2) = 472.3 - i*374.9;
end