function star_to_delta(cmp3, cmp2, cmp1, w)

# function star_to_delta(cmp3, cmp2, cmp1, w)
#
#  input the componets from the load to the source
#  as series -- parallel -- series
#
#  if the component is an inductor input the inductance
#  if the component is a capacitor input -capacitance
#
#  output is from the load to the source


		if (cmp1<0)
			X1 = 1/(w*cmp1);
		else
			X1 = cmp1*w;
		end

		if (cmp2<0)
			X2 = 1/(w*cmp2);
		else
			X2 = cmp2*w;
		end

		if (cmp3<0)
			X3 = 1/(w*cmp3);
		else
			X3 = cmp3*w;
		end

		XX = X1*X2 + X2*X3 + X1*X3;

		Xa = XX/X1;
		Xb = XX/X2;
		Xc = XX/X3;

		if (Xa < 0)
			printf("C_par=%g   ", -1/(w*Xa));
		else
			printf("L_par=%g   ", Xa/w);
		end

		if (Xb < 0)
			printf("C_ser=%g   ", -1/(w*Xb));
		else
			printf("L_ser=%g   ", Xb/w);
		end

		if (Xc < 0)
			printf("C_par=%g\n", -1/(w*Xc));
		else
			printf("L_par=%g\n", Xc/w);
		end

end
