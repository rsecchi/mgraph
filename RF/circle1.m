function v = circle1(S, z, n=1000)
  R0=50;
  Z = exp([-n:n])+z;
  Gs = (Z-R0)./(Z+R0);
  v = S(2,2)+S(1,2)*S(2,1).*Gs./(1-S(1,1).*Gs);
  plot(real(v),imag(v));
  hold on;
end
