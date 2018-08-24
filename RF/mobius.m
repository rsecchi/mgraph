% Centre and radius of the Moebius transformation
% z = (a*t+b)/(c*t+d)
function [centre,radius] = mobious(a,b,c,d)
	h = d/c
	h1 = 1/(1-(h/abs(h))^2)*(a*d-c*b)/(c*d)
	centre = h1 + b/d
	radius = abs(h1)
end