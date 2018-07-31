function v = circle(c,r,n=40)
  alpha = [0:2*pi/n:2*pi];
  v = [r*cos(alpha)+real(c); r*sin(alpha)+imag(c)]';
  plot(v(:,1),v(:,2));
  hold on;
end