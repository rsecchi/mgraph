function inversor(Z)
	A = Z(2,1)*Z(1,2)
	RL_1 = (imag(A*conj(Z(2,2)))+imag(Z(2,2))*abs(A))/imag(A)
	RL_2 = (imag(A*conj(Z(2,2)))-imag(Z(2,2))*abs(A))/imag(A)
	
end