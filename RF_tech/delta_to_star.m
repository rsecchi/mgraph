function delta_to_star(cmp_a, cmp_b, cmp_c, w)

# function delta_to_star(cmp_a, cmp_b, cmp_c, w)
#
#  input the componets from the load to the source
#  as series -- parallel -- series
#
#  if the component is an inductor input the inductance
#  if the component is a capacitor input -capacitance
#
#  output is from the load to the source

		if (cmp_a<0)
			Xa = 1/(w*cmp_a);
		else
			Xa = cmp_a*w;
		end

		if (cmp_b<0)
			Xb = 1/(w*cmp_b);
		else
			Xb = cmp_b*w;
		end

		if (cmp_c<0)
			Xc = 1/(w*cmp_c);
		else
			Xc = cmp_c*w;
		end

		XX = Xa + Xb + Xc;

		X1 = Xb*Xc/XX;
		X2 = Xa*Xc/XX;
		X3 = Xa*Xb/XX;

		if (X3 < 0)
			printf("C_ser=%g   ", -1/(w*X3));
		else
			printf("L_ser=%g   ", X3/w);
		end

		if (X2 < 0)
			printf("C_par=%g   ", -1/(w*X2));
		else
			printf("L_par=%g   ", X2/w);
		end

		if (X1 < 0)
			printf("C_ser=%g\n", -1/(w*X1));
		else
			printf("L_ser=%g\n", X1/w);
		end

end
