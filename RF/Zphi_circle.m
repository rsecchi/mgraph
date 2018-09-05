function Zphi_circle(Z1,g=1)
	grid
	cc1 = [];
	cc2 = [];
	cc3 = [];
	cc4 = [];
	for Xb = [-1000:1.53:1000]
		[a,b,Zr1,Zr2,d1,delta] = Zphi2(Z1,Xb,g);
		if (delta>0)
			Zt1 = T(T(Z1)*T(Zr1));
			Zt2 = T(T(Z1)*T(Zr2));
			[z1, z2] = Ziter(Zt1);
			[z3, z4] = Ziter(Zt2);
			zz1 = Ztrans_in(Zr1,z1)
			zz2 = Ztrans_in(Zr1,z2)
			zz3 = Ztrans_in(Zr2,z3)
			zz4 = Ztrans_in(Zr2,z4)
			
			cc1 = [cc1; S(zz1)];
			cc2 = [cc2; S(zz2)];
			cc3 = [cc3; S(zz3)];
			cc4 = [cc4; S(zz4)];
		end
	end
	plot(real(cc1),imag(cc1),'d');
	plot(real(cc2),imag(cc2),'d');
	plot(real(cc3),imag(cc3),'d');
	plot(real(cc4),imag(cc4),'d');
	
end