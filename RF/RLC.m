function RLC(R,L,C)
  omega1 = (L+sqrt(2*C*L*R^2+L^2))/(2*C*L^2)
  omega2 = (L-sqrt(2*C*L*R^2+L^2))/(2*C*L^2)
  
  f1 = sqrt(omega1)/(2*pi)
  f2 = sqrt(omega2)/(2*pi)
  
end