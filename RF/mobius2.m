% Centre and radius of the Moebius transformation
% z = (a*t+b)/(c*t+d)
function [centre,radius] = mobius2(a,b,c,d)
	A = -(a*d-c*b)/c^2;
	B = d/c;
	centre1 = A*B/(B^2-exp(2*i*arg(B)));
	centre = centre1 + a/c;
	radius = abs((a+b)/(c+d)-centre);
end