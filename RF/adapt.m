% The function takes an S matrix as input
% and returns the Gamma_in, and Gamma_out that maximise the gain
function [Gamma_in, Gamma_out] = adapt(S)
   
  % Rollet Factor
  delta = det(S);
  K = (1 - abs(S(1,1))^2 - abs(S(2,2))^2 + abs(delta)^2)/(2*abs(S(1,2)*S(2,1)));
  
  %if not( (K>1) && (abs(delta)<1) )
  %  error("The two-port is not unconditionally stable");
  %end
  
  B1 = 1 + abs(S(1,1))^2 - abs(S(2,2))^2 - abs(delta)^2
  B2 = 1 + abs(S(2,2))^2 - abs(S(1,1))^2 - abs(delta)^2
  C1 = S(1,1) - delta*conj(S(2,2))
  C2 = S(2,2) - delta*conj(S(1,1))
  D1 = abs(S(1,1))^2 - abs(delta)^2
  D2 = abs(S(2,2))^2 - abs(delta)^2
  
  Gamma_in  = (B1 - sqrt(B1^2 - 4*abs(C1)^2))/(2*C1)
  Gamma_out = (B2 - sqrt(B2^2 - 4*abs(C2)^2))/(2*C2)
  
end
