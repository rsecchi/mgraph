function inversor(Zt)

	A = Zt(2,1)*Zt(1,2);
	B = Zt(2,2);
	k1 = imag(A*B')+abs(A);
	k2 = imag(A*B')-abs(A);
	
	r1 = k1/imag(A);
	r2 = k2/imag(A);
	x1 = -k1/real(A);
	x2 = -k2/real(A);
	
	Ztrans_in(Zt,0)
	Zt(1,1)
	
	if (r1>0) Ztrans_in(Zt,r1) end
	if (r2>0) Ztrans_in(Zt,r2) end
	if (x1<0) Ztrans_in(Zt,i*x1) end
	if (x2<0) Ztrans_in(Zt,i*x2) end
	
	
end