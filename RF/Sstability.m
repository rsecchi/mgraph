function mu1 = Sstability(S)
	mu1 = (1-abs(S(1,1))^2)/(abs(S(2,2)-det(S)*conj(S(1,1)))+abs(S(2,1)*S(1,2)));
end