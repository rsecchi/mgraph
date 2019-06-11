function v = SGp(S,g,n=40)
  % Rollet Factor
  
  g = g/abs(S(2,1))^2;
  delta = det(S);
  K = (1 - abs(S(1,1))^2 - abs(S(2,2))^2 + abs(delta)^2)/(2*abs(S(1,2)*S(2,1)));
  
  B1 = 1 + abs(S(1,1))^2 - abs(S(2,2))^2 - abs(delta)^2;
  B2 = 1 + abs(S(2,2))^2 - abs(S(1,1))^2 - abs(delta)^2;
  C1 = S(1,1) - delta*conj(S(2,2));
  C2 = S(2,2) - delta*conj(S(1,1));
  D1 = abs(S(1,1))^2 - abs(delta)^2;
  D2 = abs(S(2,2))^2 - abs(delta)^2;
  
  c = (g*conj(C2))/(1+g*D2);
  r = sqrt(g^2*abs(S(2,1)*S(1,2))^2-2*g*K*abs(S(2,1)*S(1,2))+1)/abs(1+g*D2);
  
  alpha = [0:2*pi/n:2*pi];
  v = [r*cos(alpha)+real(c); r*sin(alpha)+imag(c)]';

  
end