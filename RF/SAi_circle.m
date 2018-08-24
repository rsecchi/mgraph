function SAi_circle(S1,Ai,n=40)
	a = (S1(1,1)-1)*Ai;
	b = -S1(2,1);
	c = (det(S1)-S1(2,2))*Ai;
	d = -S1(2,1);
	circle2(a,b,c,d);
end