function Zdrawc(Z1)

	hold on
	cc =[];
	for X=[-10000:100:0]
		ZZ = Zacross(Z1,X);
		R22 = real(ZZ(2,2));
		A  = ZZ(1,2)*ZZ(2,1);
		c = ZZ(1,1) - A/(2*R22);
		c = S(c)
		cc = [cc;c];
		
			
   	end
  	plot(real(cc),imag(cc),'b');
  
	cc =[];
	for X=[0:100:1000000]
		ZZ = Zacross(Z1,X);
		R22 = real(ZZ(2,2));
		A  = ZZ(1,2)*ZZ(2,1);
		c = ZZ(1,1) - A/(2*R22);
		c = S(c)
		cc = [cc;c];
		
		
   	end
  	plot(real(cc),imag(cc),'r');
  
  end