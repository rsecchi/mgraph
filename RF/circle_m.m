function v = circle_m(a,b,c,d)
	t = [-10:0.01:10];
	v = (a*t+b)./(c*t+d);
end