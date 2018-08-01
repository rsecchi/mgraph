function v = circle2(S, n=1000)
  
  alpha = [0:2*pi/n:2*pi];
  Gs = [cos(alpha)+i*sin(alpha)]';
   
  v = S(2,2)+S(1,2)*S(2,1).*Gs./(1-S(1,1).*Gs);
  plot(real(v),imag(v));
  hold on;
end