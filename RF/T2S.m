% Transfer to S parameters
function S = T2S(T)
	S11 = T(1,2)/T(2,2);
	S12 = det(T)/T(2,2);
	S21 = 1/T(2,2);
	S22 = -T(2,1)/T(2,2);
	S = [[S11 S12]; [S21 S22]];
end
