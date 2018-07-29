% The function takes an S matrix as input
% and returns the Gamma_in, and Gamma_out that maximise the gain
function K = SRollet(S)
   
  delta = det(S);
  K = (1 - abs(S(1,1))^2 - abs(S(2,2))^2 + abs(delta)^2)/(2*abs(S(1,2)*S(2,1)));
  
end
