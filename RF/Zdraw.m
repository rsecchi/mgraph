function v =Zdraw(Z1)
  
  ZL = i*([0:0.1:1000].^2);
  v = Z1(1,1)-Z1(1,2)*Z1(2,1)./(ZL+Z1(2,2));
  
  m1 = max(v);
  
  plot(real(v),imag(v),'r');
  hold on
  ZL = -ZL;
  v = Z1(1,1)-Z1(1,2)*Z1(2,1)./(ZL+Z1(2,2));
  plot(real(v),imag(v),'b');
  hold on;
  
  m2 = max(v);
  m = max(m1,m2);
  R22 = real(Z1(2,2));
  A  = Z1(1,2)*Z1(2,1);
  c = Z1(1,1) - A/(2*R22);
  r = abs(c)
  
  if ( R22>0 && abs(c)<10*abs(m) )
	v1 = [ 0; Z1(1,1)];
	plot(real(v1),imag(v1),'g');
	v2 = [c; c+A/(2*R22)];
	plot(real(v2),imag(v2),'g');
  end
  
end
