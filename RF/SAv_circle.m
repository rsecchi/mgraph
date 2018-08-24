function SAv_circle(S1,Av)
	a = (S1(1,1)+1)*Av;
	b = -S1(2,1);
	c = (det(S1)+S1(2,2))*Av;
	d = S1(2,1);
	%circle2(a,b,c,d);
	[centre,radius] = mobius2(a,b,c,d);
	circle(centre,radius);
end