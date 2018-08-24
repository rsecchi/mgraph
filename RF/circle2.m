function v = circle2(a,b,c,d)
  
  n=1000;
  cc = [];
  for theta = [0:2*pi/n:2*pi];
	z = (a*exp(i*theta)+b)/(c*exp(i*theta)+d);
	cc = [cc; z];
  end
  plot(real(cc),imag(cc));
  hold on
  A = -(a*d-c*b)/c^2;
  B = d/c;
  
  
  hold on;
end