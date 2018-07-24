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