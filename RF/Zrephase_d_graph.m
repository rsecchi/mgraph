function  Zrephase_d_graph(Z1)

	cc=[];
	for Xa = [-1000.5:10:1000.5]
		Ya = [[0 0]; [0 1/(i*Xa)]];
		Y1 = Z1^-1;
		Zm = (Y1+Ya)^-1
		Sp = real(Zm(2,1)+Zm(1,2))/real(Zm(1,1)+Zm(2,2));
		Xc = -imag(conj(Zm(2,1)+Zm(1,2))*(Zm(1,1)+Zm(2,2)))/real(Zm(1,2)+Zm(2,1));
		cc = [cc; [Xa Sp Xc]];
	end
	plot(cc(:,1),cc(:,2));
	
end