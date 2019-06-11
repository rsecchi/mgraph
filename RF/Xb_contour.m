function Xb_contour()

    %psh(Z11, Z12, Z21, Z22, Zin, f0)

	delta = 0.1;
    x = [-1:delta:1];
	in = 0;
	out = 0;
    for gamma_r = x;
		for gamma_i = x;
			gamma = gamma_r + i * gamma_i;
			if abs(gamma) > 1
				out++;
			else
				in++;
			end
		end
	end
	
	
end