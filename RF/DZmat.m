%  function ZZ = Zmat(resp,ni)
%        resp = response function from LT-spice
%        ni   = reference frequency
%
function ZZ = DZmat(resp,ni)

	F = size(resp{1})(1);
	[mm, p] = min(abs(resp{1}-ni));

	% Use extrapolation in extreme cases
	if (p==1) p++; end
	if (p==F) p--; end

	x0 = resp{1}(p-1);
	x1 = resp{1}(p);
	x2 = resp{1}(p+1);
	
	% Lagrange interpolation
	k0 =  (2*ni-(x1+x2))/((x1-x0)*(x2-x0));
	k1 = -(2*ni-(x0+x2))/((x1-x0)*(x2-x1));
	k2 =  (2*ni-(x0+x1))/((x2-x0)*(x2-x1));
		
	y0 = resp{2}(2*(p-2)+1:2*(p-2)+2,1:2);
	y1 = resp{2}(2*(p-1)+1:2*(p-1)+2,1:2);
	y2 = resp{2}(2*p+1:2*p+2,1:2);
	
	ZZ = k0*y0 + k1*y1 + k2*y2;
	
end