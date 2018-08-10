% Centre and radius of the Moebius transformation
% z = (a*t+b)/(c*t+d)
function mm = max_mobius(a,b,c,d)
	h = d/c;
	h1 = 1/(1-(h/abs(h))^2)*(a*d-c*b)/(c*d);
	centre = h1 + b/d;
	radius = abs(h1);
	
	k = centre + i*radius;
	
	t = -real((d*k-b)/(c*k-a));
	if t>0
		mm = imag(k);
	else
		mm = max(a/c,b/d);
	end
end