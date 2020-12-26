function imp_tr(Rn, Rl, w)

# usage: imp_tr(Rn, Rl, w)
#
# This function compute the L-transformer
# from the impedance Rl to Rn at angular frequency w (rad/sec)
# 
#    Rl  =  load impedance
#    Rn  =  new impedance
#
# The output is calculated from the load to the source
# as series/parallel discrete components

if (Rn>=Rl)
	X1 = sqrt(Rl*(Rn-Rl));
	X2 = Rn*Rl/X1;

	C1 = 1/(X1*w);
	L1 = X1/w;

	C2 = 1/(X2*w);
	L2 = X2/w;

	printf("C_ser=%g   and   L_par=%g \n", C1, L2);
	printf("L_ser=%g   and   C_par=%g \n", L1, C2);

else
	X1 = sqrt(Rn/(Rl-Rn))*Rl;
	X2 = Rn*Rl/X1;

	C1 = 1/(X1*w);
	L1 = X1/w;

	C2 = 1/(X2*w);
	L2 = X2/w;

	printf("C_par=%g   and   L_ser=%g \n", C1, L2);
	printf("L_par=%g   and   C_ser=%g \n", L1, C2);
	
endif

end

