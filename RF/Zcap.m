function Zcap(Z1,m=10000)

	cc1 =[];
	cc2 =[];
	cc3 =[];
	for X=[-m:10:0]
		ZZ = Zacross(Z1,i*X);
		R22 = real(ZZ(2,2));
		A  = ZZ(1,2)*ZZ(2,1);
		c = ZZ(1,1) - A/(2*R22);
		r = abs(A/(2*R22));
		
		cc1 = [cc1;-X+i*imag(c)];
		cc2 = [cc2;-X+r*i];
		cc3 = [cc3;-X+i*real(c)];
  	end
	
	hold on;
  	plot(real(cc1),imag(cc1),'b');
    plot(real(cc2),imag(cc1+cc2),'g');
	plot(real(cc3),imag(cc3),'r');
	
  end